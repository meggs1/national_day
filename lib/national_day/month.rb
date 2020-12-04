class NationalDay::Month
    @@all = []
    attr_accessor :name, :holidays, :days

    def initialize(name)
        @name = name
        @holidays = []
        save
    end
    
    def self.all
        NationalDay::Scraper.scrape_months if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end


    def get_holidays
        NationalDay::Scraper.scrape_holidays(self) if @holidays.empty?
    end
end
