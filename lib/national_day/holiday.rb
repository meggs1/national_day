class NationalDay::Holiday
attr_accessor :name, :date, :link, :description
@@all = []

def initialize(name, date, link)
    @name = name
    @@date = date
    @link = link
    @description = []
    @@all << self
end

def self.all
    @@all
end

end

