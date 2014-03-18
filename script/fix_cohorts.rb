# Implemented to fix the stupidity of using the db:seeds file,
# which blows away all data, in production and therefore having
# member cohorts be all screwed up.
require 'open-uri'

puts "test"

file_contents = open("https://codingschoolalumni.s3.amazonaws.com/members_export_5ebad133f8_20140318.csv") {|f| f.read}
# puts file_contents

file_contents.split("\n").each_with_index do |l,i|
  next if i < 1
  # puts l
  arr = l.split(",")
  # puts arr.size
  u = User.where(:email => arr.first).first
  puts "User: #{u.fname} #{u.lname}!"
  if Cohort.where(:id => u.cohort_id).empty?
    puts "Can't find the cohort!"
    city = City.where(:name => arr[5]).first
    puts "City: #{city.name}!"
    school = School.where(:name => arr[4]).first
    puts "School: #{school.name}!"

    raise "something screwed up" if u.nil? || city.nil? || school.nil?
    cohort = Cohort.where(:city_id => city.id, :school_id => school.id, :start_date => arr[6])
    
    raise "couldn't find the cohort!" if cohort.nil?
    puts "#{u.fname} #{u.lname} should be in cohort #{cohort.id}!"
  end
end