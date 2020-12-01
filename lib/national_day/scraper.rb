class NationalDay::Scraper

    def self.scrape_index_page
        months = []
        doc = Nokogiri::HTML(open("https://nationaltoday.com/national-day-calendar/"))
        doc.css("div.daycal-month").each do |month|
            month_data = {}
            month_data[:name] = month.css("h2.daycal-month-name").text
            month_data[:link] = month.css("div.daycal-month-link a").attr("href").value
            month_data[:discription] = month.css("div.daycal-month-descr").text.strip
            months << month_data
        end    
        months   
    end

    def self.scrape_month_page(link)
        whole_month_holidays = {}

        whole_month = "https://nationaltoday.com/#{name}-holiday" 
        doc = Nokogiri::HTML(open(whole_month))


        
    end
    
    binding.pry

end


# month_name = thing.css("h2.daycal-month-name").text
# month_link = thing.css("div.daycal-month-link a").attr("href")
# month_discription = thing.css("div.daycal-month-descr").text.strip