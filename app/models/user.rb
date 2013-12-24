require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  [:cohort_id, :fname, :lname].each do |col|
    validates col, :presence => true
  end
  validates_format_of :email, :with => /@/

  # after_save :subscribe
  after_create :send_welcome
  before_destroy :unsubscribe

  belongs_to :cohort
  has_one :school, :through => :cohort
  has_many :jobs

  # Subscribes a new user to the mailchimp list
  def subscribe
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
      :id => ENV["MAILCHIMP_LIST_ID"],
      :email => {:email => self.email},
      :merge_vars => {
        :FNAME => self.fname,
        :LNAME => self.lname,
        :COHORT_ID => self.cohort_id,
        :SCHOOL => self.school.name,
        :CITY => self.cohort.city.name,
        :SDATE => self.cohort.start_date,
        :EDATE => self.cohort.end_date,
        :ENV => Rails.env
      },
      :double_optin => false,
      :update_existing => true,
      :send_welcome => false
      })
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end

  # Unsubscribe user from the MailChimp mailing list
  def unsubscribe
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.unsubscribe({
      :id => ENV["MAILCHIMP_LIST_ID"],
      :email => {:email => self.email},
      :delete_member => true, # this is NOT the default value
      :send_notify => true,
      :send_goodbye => true
      })
    Rails.logger.info("Unsubscribed #{self.email} from MailChimp") if result
  end

  # Use the internal mailer to send a welcome email
  def send_welcome
    UserMailer.welcome_email(self).deliver!
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

end