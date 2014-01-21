# This will populate the DB with school and cohort data (no students)

# NOTE: THIS WILL WIPE OUT ALL OLD DATA AND REPLACE IT

# Wiping out old data
City.delete_all
School.delete_all
Cohort.delete_all

# Cities (unique constraint on name)
City.create(:name=>"San Francisco", :abbrev=>"SF")
City.create(:name=>"New York City", :abbrev=>"NYC")
City.create(:name=>"Chicago", :abbrev=>"CHI")
City.create(:name=>"Boston", :abbrev=>"BOS")
City.create(:name=>"Los Angeles", :abbrev=>"LA")
City.create(:name=>"London", :abbrev=>"LOND")
City.create(:name=>"Berlin", :abbrev=>"BERL")
City.create(:name=>"Hong Kong", :abbrev=>"HK")
City.create(:name=>"Sydney", :abbrev=>"SYD")
City.create(:name=>"Washington DC", :abbrev=>"DC")

# Schools (unique constraint on name)
School.create(:name=>"App Academy")
School.create(:name=>"Dev Bootcamp")
School.create(:name=>"Hack Reactor")
School.create(:name=>"Hackbright Academy")
School.create(:name=>"General Assembly")

# ************************ APP ACADEMY *****************************
school_id = School.find_by_name("App Academy").id

# SF App Academy
city_id = City.find_by_name("San Francisco").id
{
  "2012-07-23" => "2012-09-21",
  "2013-01-07" => "2013-03-08",
  "2013-03-11" => "2013-05-10",
  "2013-05-13" => "2013-07-12",
  "2013-07-15" => "2013-10-04",
  "2013-09-16" => "2013-12-06",
  "2014-01-27" => "2014-04-18",
  "2014-03-31" => "2014-06-20",
  "2014-06-02" => "2014-08-22",
  "2014-08-04" => "2014-10-24",
  "2014-10-06" => "2014-12-26",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# NY App Academy
city_id = City.find_by_name("New York City").id
{
  "2013-04-15" => "2013-06-14",
  "2013-06-17" => "2013-08-16",
  "2013-08-19" => "2013-11-08",
  "2013-10-21" => "2014-01-10",
  "2013-12-30" => "2014-03-21",
  "2014-03-03" => "2014-05-23",
  "2014-05-05" => "2014-07-25",
  "2014-07-07" => "2014-09-26",
  "2014-09-08" => "2014-11-28",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

#************************* DEV BOOTCAMP ************************
school_id = School.find_by_name("Dev Bootcamp").id

# SF Dev Bootcamp
city_id = City.find_by_name("San Francisco").id
{
  "2012-02-06" => "2012-03-30",
  "2012-06-11" => "2012-08-17",
  "2012-10-01" => "2012-12-07",
  "2013-01-28" => "2013-03-29",
  "2013-02-18" => "2013-04-19",
  "2013-03-11" => "2013-05-10",
  "2013-04-01" => "2013-05-31",
  "2013-04-22" => "2013-06-12",
  "2013-05-13" => "2013-07-12",
  "2013-06-03" => "2013-08-02",
  "2013-06-24" => "2013-08-23",
  "2013-07-15" => "2013-09-13",
  "2013-08-05" => "2013-10-04",
  "2013-08-26" => "2013-10-25",
  "2013-09-16" => "2013-11-15",
  "2013-10-07" => "2013-12-06",
  "2014-01-06" => "2014-03-07",
  "2014-01-27" => "2014-03-28",
  "2014-02-17" => "2014-04-18",
  "2014-03-10" => "2014-05-09",
  "2014-03-31" => "2014-05-30",
  "2014-04-21" => "2014-06-20",
  "2014-05-12" => "2014-06-11",
  "2014-06-02" => "2014-08-01",
  "2014-06-23" => "2014-08-22",
  "2014-07-14" => "2014-09-12",
  "2014-08-04" => "2014-10-03",
  "2014-08-25" => "2014-10-24",
  "2014-09-14" => "2014-11-14",
  "2014-10-06" => "2014-12-05",
  "2014-10-27" => "2015-01-09",
  "2014-11-17" => "2015-01-30",
  "2014-12-08" => "2015-02-20",
  "2015-01-05" => "2015-03-06",
  "2015-01-26" => "2015-03-27",
  "2015-02-16" => "2015-04-17",
  "2015-03-09" => "2015-05-08",
  "2015-03-30" => "2015-05-29",
  "2015-04-20" => "2015-06-19",
  "2015-05-11" => "2015-07-10",
  "2015-06-01" => "2015-07-31",
  "2015-06-22" => "2015-08-21",
  "2015-07-13" => "2015-09-11",
  "2015-08-03" => "2015-10-02",
  "2015-08-24" => "2015-10-23",
  "2015-09-14" => "2015-11-13",
  "2015-10-05" => "2015-12-04",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# CHI Dev Bootcamp
city_id = City.find_by_name("Chicago").id
 {
  "2013-04-22" => "2013-06-12",
  "2013-05-13" => "2013-07-12",
  "2013-06-03" => "2013-08-02",
  "2013-06-24" => "2013-08-23",
  "2013-07-15" => "2013-09-13",
  "2013-08-05" => "2013-10-04",
  "2013-08-26" => "2013-10-25",
  "2013-09-16" => "2013-11-15",
  "2013-10-07" => "2013-12-06",
  "2014-01-06" => "2014-03-07",
  "2014-01-27" => "2014-03-28",
  "2014-02-17" => "2014-04-18",
  "2014-03-10" => "2014-05-09",
  "2014-03-31" => "2014-05-30",
  "2014-04-21" => "2014-06-20",
  "2014-05-12" => "2014-06-11",
  "2014-06-02" => "2014-08-01",
  "2014-06-23" => "2014-08-22",
  "2014-07-14" => "2014-09-12",
  "2014-08-04" => "2014-10-03",
  "2014-08-25" => "2014-10-24",
  "2014-09-14" => "2014-11-14",
  "2014-10-06" => "2014-12-05",
  "2014-10-27" => "2015-01-09",
  "2014-11-17" => "2015-01-30",
  "2014-12-08" => "2015-02-20",
  "2015-01-05" => "2015-03-06",
  "2015-01-26" => "2015-03-27",
  "2015-02-16" => "2015-04-17",
  "2015-03-09" => "2015-05-08",
  "2015-03-30" => "2015-05-29",
  "2015-04-20" => "2015-06-19",
  "2015-05-11" => "2015-07-10",
  "2015-06-01" => "2015-07-31",
  "2015-06-22" => "2015-08-21",
  "2015-07-13" => "2015-09-11",
  "2015-08-03" => "2015-10-02",
  "2015-08-24" => "2015-10-23",
  "2015-09-14" => "2015-11-13",
  "2015-10-05" => "2015-12-04",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# NYC Dev Bootcamp
city_id = City.find_by_name("New York City").id
{
  "2014-03-31" => "2014-05-30",
  "2014-04-21" => "2014-06-20",
  "2014-05-12" => "2014-06-11",
  "2014-06-02" => "2014-08-01",
  "2014-06-23" => "2014-08-22",
  "2014-07-14" => "2014-09-12",
  "2014-08-04" => "2014-10-03",
  "2014-08-25" => "2014-10-24",
  "2014-09-14" => "2014-11-14",
  "2014-10-06" => "2014-12-05",
  "2014-10-27" => "2015-01-09",
  "2014-11-17" => "2015-01-30",
  "2014-12-08" => "2015-02-20",
  "2015-01-05" => "2015-03-06",
  "2015-01-26" => "2015-03-27",
  "2015-02-16" => "2015-04-17",
  "2015-03-09" => "2015-05-08",
  "2015-03-30" => "2015-05-29",
  "2015-04-20" => "2015-06-19",
  "2015-05-11" => "2015-07-10",
  "2015-06-01" => "2015-07-31",
  "2015-06-22" => "2015-08-21",
  "2015-07-13" => "2015-09-11",
  "2015-08-03" => "2015-10-02",
  "2015-08-24" => "2015-10-23",
  "2015-09-14" => "2015-11-13",
  "2015-10-05" => "2015-12-04",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

#********************* HACK REACTOR **********************
school_id = School.find_by_name("Hack Reactor").id

# SF Hack Reactor
city_id = City.find_by_name("San Francisco").id
 {
  "2013-01-18" => "2013-04-26",
  "2013-03-11" => "2013-06-14",
  "2013-04-29" => "2013-08-02",
  "2013-06-17" => "2013-09-20",
  "2013-08-05" => "2013-11-08",
  "2013-09-23" => "2013-12-20",
  "2014-01-06" => "2014-03-28",
  "2014-02-24" => "2014-05-09",
  "2014-04-14" => "2014-07-04",
  "2014-06-02" => "2014-08-22",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

#*********************** HACKBRIGHT ACADEMY *********************
school_id = School.find_by_name("Hackbright Academy").id

# SF Hackbright Academy
city_id = City.find_by_name("San Francisco").id
{
  "2012-06-04" => "2012-08-13",
  "2012-10-01" => "2012-12-07",
  "2013-03-04" => "2013-05-10",
  "2013-06-17" => "2013-09-23",
  "2013-09-26" => "2013-11-01",
  "2014-02-04" => "2014-04-11",
  "2014-02-04" => "2014-04-11",
  "2014-06-02" => "2014-08-08",
  "2014-09-29" => "2014-12-05",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

#***************** GENERAL ASSEMBLY ********************************
school_id = School.find_by_name("General Assembly").id

# SF General Assembly
city_id = City.find_by_name("San Francisco").id
{
  "2013-05-20" => "2013-08-09",
  "2013-06-17" => "2013-09-06",
  "2013-09-23" => "2013-12-19",
  "2013-12-16" => "2014-02-28",
  "2014-01-06" => "2014-04-01",
  "2014-03-31" => "2014-06-20",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# NY General Assembly
city_id = City.find_by_name("New York City").id
{
  "2013-05-20" => "2013-08-09",
  "2013-06-17" => "2013-09-06",
  "2013-08-26" => "2013-11-15",
  "2013-09-23" => "2013-12-19",
  "2013-12-02" => "2014-03-04",
  "2014-01-06" => "2014-04-01",
  "2014-02-24" => "2014-05-21",
  "2014-04-21" => "2014-07-11",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# BOS General Assembly
city_id = City.find_by_name("Boston").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-23" => "2013-12-19",
  "2014-01-06" => "2014-04-01",
  "2014-04-21" => "2014-07-11",
  "2014-06-09" => "2014-08-29",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# LA General Assembly
city_id = City.find_by_name("Los Angeles").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-23" => "2013-12-19",
  "2013-12-02" => "2014-03-04",
  "2014-01-06" => "2014-04-01",
  "2014-03-31" => "2014-06-20",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# Washington DC General Assembly
city_id = City.find_by_name("Washington DC").id
{
  "2014-04-21" => "2014-07-11",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# LOND General Assembly
city_id = City.find_by_name("London").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-30" => "2013-12-20",
  "2013-12-16" => "2014-02-28",
  "2014-03-31" => "2014-06-20",
  "2014-04-21" => "2014-07-11",
  "2014-06-02" => "2014-08-22",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# BERL General Assembly
city_id = City.find_by_name("Berlin").id
{
  "2013-06-17" => "2013-09-06",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# HK General Assembly
city_id = City.find_by_name("Hong Kong").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-30" => "2013-12-20",
  "2014-02-17" => "2014-05-16",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# SYD General Assembly
city_id = City.find_by_name("Sydney").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-30" => "2013-12-20",
  "2013-12-16" => "2014-02-28",
  "2014-02-24" => "2014-05-21",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}



























