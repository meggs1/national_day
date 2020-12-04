class NationalDay::CLI 

    def call
        puts "Welcome to National Day!"
        get_months
        list_months
        get_user_month
        # list_days
        # get_user_day
        
        # display_holidays
        
    end

    def get_months
        @months = NationalDay::Month.all
    end

    def get_holidays(month)
        @holidays = NationalDay::Holiday.all
    end

    def list_months
        puts "Choose a month or type 'today' to see today's National Holidays"
        @months.each.with_index(1)  {|month, i| puts "#{i}. #{month.name}"}
    end

    def get_user_month
        user_month = gets.strip.to_i
        display_holidays_by_month(user_month.to_i) if valid_input(user_month, @months)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def display_holidays_by_month(user_month)
        month = @months[user_month - 1]
        month.get_holidays
        puts "Every holiday in #{month.name}"
        month.holidays.each.with_index(1) {|holiday, i| puts "#{i}. #{holiday.name}"}
        get_user_holiday(month)
    end

    def get_user_holiday(month)
        puts "Choose holiday to see description"
        input = gets.strip
        holiday = month.holidays[input.to_i]
        holiday.get_description
        show_description(holiday)
    end

    def show_description(holiday)
        puts holiday.name
        holiday.description.each {|d| puts "#{d}"}
    end

    


end