# This will populate the DB with school and cohort data (no students)

# NOTE: Only the General Assembly cohorts don't include hard coding
# of school and city IDs (though still use finds)

# NOTE2: This will not work properly if overlapped with a previous
# seed... so you'll have to manually enter the changes to the DB if
# you've already been using it for a little while (the IDs are hard
# coded and the cohorts don't have unique constraints so they would
# double up)

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

# Schools (unique constraint on name)
School.create(:name=>"App Academy")
School.create(:name=>"Dev Bootcamp")
School.create(:name=>"Hack Reactor")
School.create(:name=>"Hackbright Academy")
School.create(:name=>"General Assembly")

# ************************ APP ACADEMY *****************************
# SF App Academy

{
  "2012-07-23" => "2012-09-21",
  "2013-01-07" => "2013-03-08",
  "2013-03-11" => "2013-05-10",
  "2013-05-13" => "2013-07-12",
  "2013-07-15" => "2013-10-04",
  "2013-09-16" => "2013-12-06",
  "2014-01-27" => "2014-04-18",
  "2014-03-31" => "2014-06-20",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 1, :city_id => 1)}

# NY App Academy

{
  "2013-04-15" => "2013-06-14",
  "2013-06-17" => "2013-08-16",
  "2013-08-19" => "2013-11-08",
  "2013-10-21" => "2014-01-10",
  "2013-12-30" => "2014-03-21",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 1, :city_id => 2)}

#************************* DEV BOOTCAMP ************************

# SF Dev Bootcamp

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
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 2, :city_id => 1)}

# CHI Dev Bootcamp

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
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 2, :city_id => 3)}

#********************* HACK REACTOR **********************
# SF Hack Reactor

 {
  "2013-01-18" => "2013-04-26",
  "2013-03-11" => "2013-06-14",
  "2013-04-29" => "2013-08-02",
  "2013-06-17" => "2013-09-20",
  "2013-08-05" => "2013-11-08",
  "2013-09-23" => "2013-12-20",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 3, :city_id => 1)}

#*********************** HACKBRIGHT ACADEMY *********************

# SF Hackbright Academy

{
  "2012-10-01" => "2012-12-07",
  "2013-03-04" => "2013-05-10",
  "2013-06-17" => "2013-09-23",
  "2013-09-26" => "2013-11-01",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => 4, :city_id => 1)}

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
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# BOS General Assembly
city_id = City.find_by_name("Boston").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-23" => "2013-12-19",
  "2014-01-06" => "2014-04-01",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# LA General Assembly
city_id = City.find_by_name("Los Angeles").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-23" => "2013-12-19",
  "2013-12-02" => "2014-03-04",
  "2014-01-06" => "2014-04-01",
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}

# LOND General Assembly
city_id = City.find_by_name("London").id
{
  "2013-06-17" => "2013-09-06",
  "2013-09-30" => "2013-12-20",
  "2013-12-16" => "2014-02-28",
  "2014-03-31" => "2014-06-20",
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
}.map {|s,e| Cohort.create(:start_date => (Date.parse(s)+12.hours), :end_date => (Date.parse(e)+12.hours), :school_id => school_id, :city_id => city_id)}



























