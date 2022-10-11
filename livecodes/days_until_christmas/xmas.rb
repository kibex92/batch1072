require 'date'
def days_to_christmas(date = Date.today)
  christ_date = Date.new(date.year,12,25)

  if date > christ_date
    christ_date = christ_date.next_year
  end

  days_to_christmas = christ_date-date
  return days_to_christmas.to_i
end



puts days_to_christmas.class == Integer
puts days_to_christmas(Date.new(2022, 12, 25))  == 0
puts days_to_christmas(Date.new(2022, 12, 26)) == 364
puts days_to_christmas(Date.new(2099, 12, 24)) == 1