class NationalDay::CLI 
    # MONTHS = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"]

    def call
        puts "Welcome to National Day!"
        get_months
        list_months
        # get_user_month
        # get_user_day
        # get_holidays_for(day)
        # list_holidays
        
    end

    def get_months
        @months = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"]
    end

    def list_months
        puts "Choose a month or type 'today' to see today's National Holidays"
        @months.each.with_index(1) do |month, i|
            puts "#{i}. #{month}"
        end
    end


    # def get_user_month
    #     chosen_month = gets.strip
    #     if valid_input(chosen_month.to_i)
            
    #     end
        
    # end
    

end