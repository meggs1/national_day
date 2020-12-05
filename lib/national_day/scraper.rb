class NationalDay::Scraper

    def self.scrape_months
        doc = Nokogiri::HTML(open("https://nationaltoday.com/national-day-calendar/"))
        months = doc.css("div.daycal-month")

        months.each do |month|
            name = month.css("h2.daycal-month-name").text
            link = month.css("div.daycal-month-link a").attribute("href").value
            NationalDay::Month.new(name, link)
        end
    end

    def self.scrape_celebration(month)
        url = month.link
        doc = Nokogiri::HTML(open(url))

        celebrations = doc.css("tr.row-data.row-months")

        celebrations.each do |celebration|
            name = celebration.css("td.title").text
            category = celebration.css("td.category").text
            link = celebration.css("td.title a").attribute("href").value
            NationalDay::Celebration.new(name, month, category, link)
        end
    end

    def self.scrape_info(celebration)
        url = celebration.link
        doc = Nokogiri::HTML(open(url))
        descriptions = doc.css("div.entry-content-inner")

        descriptions.each do |description|
            info = description.css("p").text
        end
        
    end
    


    # attr_reader :url, :month, :day

    # def initialize(month, day)
    #     @month = month.capitalize
    #     @day = day.to_i
    #     @url = "https://nationaltoday.com/#{month}-#{day}-holidays/"
    # end

    # def parse_url(url)
    #     unparsed_page = HTTParty.get(url)
    #     Nokogiri::HTML(unparsed_page)
    # end

    # def self.scrape_holidays
    #     holidays = []
    #     parsed_page = parse_url(@url)
        
    #     parsed_page.css("tr.row-data").each do |holiday|
    #         holiday_info = {}
    #         holiday_info[:month] = @month
    #         holiday_info[:day] = @day
    #         holiday_info[:name] = holiday.css("td.title").text
    #         holiday_info[:category] = holiday.css("td.category").text
    #         holiday_info[:link] = holiday.css("a").attr("href").value
    #         holidays << holiday_info
    #     end
    #     holidays
    # end


    # def create_holiday_hash(holiday_hash)    
    #     holiday_hash.collect { |holiday|
    #     { month: @month,
    #     day: @day,
    #     name: holiday.css("td.title").text,
    #     category: holiday.css("td.category").text,
    #     link: holiday.css("a").attr("href").value }
    #     }
    #  end

    # def scrape_holiday_page(holiday_link)
    #     holiday_page = Nokogiri::HTML(open(holiday_link))

    #     description = holiday_link.css("div.entry-content-inner").text
    #     holiday_additional_info ={
    #         description: description
    #     }
    # end

    



    # def self.scrape_months
    #     doc = Nokogiri::HTML(open("https://nationaltoday.com/national-day-calendar/"))
    #     months = doc.css("h2.daycal-month-name")

    #     months.each do |month|
    #         name = month.text
    #         NationalDay::Month.new(name)
    #     end
    # end

    # def self.scrape_holidays(month)
    #     doc = Nokogiri::HTML(open("https://nationaltoday.com/#{month.name.downcase}-holidays"))
    #     holidays = doc.css("tr.row-data")
    #     holidays.each do |h|
    #         name = h.css("td.title").text
    #         category = h.css("td.category").text
    #         link = h.css("td.title a").attr("href").value
    #         NationalDay::Holiday.new(name, month, category, link)
    #     end
    # end

    # def self.scrape_description(holiday)
    #     doc = Nokogiri::HTML(open(holiday.link))
    #     pages = doc.css("div.entry-content-inner")
        
    #     pages.each do |page|
    #         description = page.css("p").text
    #         holiday.description << description
    #     end
        
    # end
    
    

    
end

##WORKING w
# def self.scrape_days(month)
#     doc = Nokogiri::HTML(open("https://nationaltoday.com/#{month.name.downcase}-holidays"))
#     days = doc.css("tr.row-data")
#     days.each do |day|
#         name = day.css("td.title").text
#         category = day.css("td.category").text
#         link = day.css("td.title a").attr("href").value
#         NationalDay::Holiday.new(name, month, category, link)
#     end

# end