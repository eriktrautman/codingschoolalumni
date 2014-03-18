# Implemented to fix the stupidity of using the db:seeds file,
# which blows away all data, in production and therefore having
# member cohorts be all screwed up.

puts "test"

File.open(ENV["USER_EXPORT_20140318"]).each_with_index do |l,i|
  next if i < 1
  # puts l
  arr = l.split(",")
  # puts arr.size
  u = User.where(:email => arr.first).first
  puts "User: #{u.first_name}!"
  if Cohort.where(:id => u.cohort_id).empty?
    puts "Can't find the cohort!"
    city = City.where(:name => arr[5]).first
    puts "City: #{city.name}!"
    school = School.where(:name => arr[4]).first
    puts "School: #{school.name}!"
    raise "something screwed up" if u.nil? || city.nil? || school.nil?
    cohort = Cohort.where(:city_id => city.id, :school_id => school.id, :start_date => arr[6])
    raise "couldn't find the cohort!" if cohort.nil?
    puts "#{u.first_name} should be in cohort #{cohort.id}!"
  end
end