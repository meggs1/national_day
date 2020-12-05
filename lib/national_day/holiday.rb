class NationalDay::Celebration
attr_accessor :name, :month, :category, :link, :description
@@all = []

def initialize(name, month, category, link)
    @name = name
    @month = month
    @category = category
    @link = link
    @description = []
    add_to_month
    @@all << self
end

def self.all
    @@all
end

def add_to_month
    @month.celebrations << self unless @month.celebrations.include?(self)
end

def get_celebration_details
    NationalDay::Scraper.scrape_info(self) if @description.empty?
end



# def initialize(name, month, day, category, link)
#     @name = name
#     @month = month
#     @day = day
#     @category = category
#     @link = link
#     @description = []
    
#     add_to_month
#     save
# end



# def self.all
#     @@all
# end

# def save
#     @@all << self
# end

# def add_to_month
#     @month.holidays << self unless @month.holidays.include?(self)
# end

# def get_description
#     NationalDay::Scraper.scrape_description(self) if @description.empty?
# end


end