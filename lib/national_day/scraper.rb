class NationalDay::Scraper

    def self.scrape_months
        doc = Nokogiri::HTML(open("https://nationaltoday.com/national-day-calendar/"))
        
        doc.css("div.daycal-month").each do |month|
            month_info = {}

            month_info[:name] = month.css("h2.daycal-month-name").text
            month_info[:link] = month.css("a").attribute("href").value
            month_info[:description] = month.css("div.daycal-month-descr").text.strip
            
            months << month_info
        end

        
    end
    
    








    
    
    # def self.scrape_months(month)
    #     months = []
    #     doc = Nokogiri::HTML(open("https://nationaltoday.com/#{month}-holidays"))
    #     entire_month = doc.css("table.archive-table")

    #     entire_month.each do |m|
    #         month_details = {}
    #         month_details[:name] = month
    #         title = m.css("title.a").text.strip
    #          binding.pry
    #     end

       
        
