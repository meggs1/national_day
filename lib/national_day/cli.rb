class NationalDay::CLI #name spaced to help identify

    def call
        puts "\n Welcome to National Day! \n"
        get_months
        list_months
        get_user_month
        # get_user_day
        # get_holidays_for(day)
        # list_holidays
        
    end

    def get_months
        # to be scraped instead
        @months = ["Jan", "Feb", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    end

    def list_months

        puts "Choose the number of a month:"
        @months.each.with_index(1) do |month, index|
            puts "#{index}. #{month}"
        end
    end

    def get_user_month
        chosen_month = gets.strip
        # if valid_input(chosen_month.to_i)
            
        # end
        
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

end