require 'time'

start_time = "17:00"

s = Time.parse(start_time).strftime("%H:%M")

puts s
# start_time_to_date_time = DateTime.parse(start_time)
# end_time_to_date_time   = DateTime.parse(end_time)
