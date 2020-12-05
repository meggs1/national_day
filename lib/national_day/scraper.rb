class NationalDay::Scraper

    def self.scrape_main_page
        doc = Nokogiri::HTML(open("https://nationaltoday.com"))
        day_cards = doc.css("div.slider-day-content")

        day_cards.each do |day_card|
            date = day_card.css("span.ntdb-holiday-date").text
            link = day_card.css("a").attr("href")
            name = day_card.css("h2.holiday-title-text").text
            NationalDay::Holiday.new(name, date, link)
        end
    end

end