require_relative './lib/communication_display.rb'
require_relative './lib/file_finder.rb'
require_relative './lib/writer_csv.rb'
require 'csv'

folder = Dir['./db/*.csv']
CommunicationDisplay.perform
FileFinder.new(folder: folder).perform

