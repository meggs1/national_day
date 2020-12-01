require_relative "./national_day/version"
require_relative "./national_day/cli"
require_relative "./national_day/scraper"
require_relative "./national_day/holiday"

require 'pry'
require 'nokogiri'
require 'open-uri'

module NationalDay
  class Error < StandardError; end
  # Your code goes here...
end
