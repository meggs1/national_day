class NationalDay::Scraper

    def self.scrape_months
        doc = Nokogiri::HTML(open("https://nationaltoday.com/national-day-calendar/"))
        months = doc.css("h2.daycal-month-name")

        months.each do |month|
            name = month.text
            NationalDay::Month.new(name)
        end
    end

    def self.scrape_holidays(month)
        doc = Nokogiri::HTML(open("https://nationaltoday.com/#{month.name.downcase}-holidays"))
        holidays = doc.css("tr.row-data")
        holidays.each do |h|
            name = h.css("td.title").text
            category = h.css("td.category").text
            link = h.css("td.title a").attr("href").value
            NationalDay::Holiday.new(name, month, category, link)
        end
    end

    def self.scrape_description(holiday)
        doc = Nokogiri::HTML(open(holiday.link))
        pages = doc.css("div.page-content-wrap")

        pages.each do |page|
            description = page.css("div.holiday-section.holiday-content").text
            holiday.description << description
            
        end
        
    end
    
    

    
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