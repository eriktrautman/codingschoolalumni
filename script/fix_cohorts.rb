# Implemented to fix the stupidity of using the db:seeds file,
# which blows away all data, in production and therefore having
# member cohorts be all screwed up.

require 'open-uri'
require 'csv'

puts "test"
url = "https://codingschoolalumni.s3.amazonaws.com/members_export_5ebad133f8_20140318.csv"
# Note: this URL is now expired.

csv_file = CSV.new(open(url), :headers => :first_row)
# file_contents = CSV.read(csv_file) #{|f| f.read}
# puts file_contents

csv_file.each_with_index do |arr,i|
  next if i < 1
  # break if i >= 2
  puts "\n\n New user! \n"
  u = User.where(:email => arr["Email Address"]).first
  if u.nil?
    puts "\n\n\n\n\n\n\n\n COULDNT FIND USER #{arr['Email Address']}!!!!!!!\n\n\n\n\n\n"
  else
    puts "User: #{u.fname} #{u.lname}!"
    if Cohort.where(:id => u.cohort_id).empty?
      puts "Can't find this user's cohort!"

      city = City.where(:name => arr["City"]).first
      puts "City: #{city.name}!"

      school = School.where(:name => arr["School"]).first
      puts "School: #{school.name}!"

      raise "something screwed up" if u.nil? || city.nil? || school.nil?
      puts "About to look for the cohort with city_id:#{city.id}, school_id:#{school.id}, start_date:#{arr['Start Date']}, end_date:#{arr['End Date']}!"
      cohort = Cohort.where(:city_id => city.id, :school_id => school.id, :start_date => Date.parse(arr["Start Date"])+12.hours, :end_date => Date.parse(arr["End Date"])+12.hours).first
      
      if cohort.nil?
        puts "\n\n\n\n\n\n\n\n Couldn't find the cohort for #{u.fname} #{u.lname}!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n\n\n\n\n\n\n\n\n" 
      else
        u.update_attribute(:cohort_id, cohort.id)
        puts "#{u.fname} #{u.lname} was moved to cohort #{cohort.id}!"
      end
    end
  end
end