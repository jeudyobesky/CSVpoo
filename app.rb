require_relative './lib/communication_display.rb'
require_relative './lib/file_finder.rb'
require_relative './lib/writer.rb'
require 'csv'

folder = Dir['./db/*.csv']
CommunicationDisplay.perform
data = FileFinder.new(folder: folder).perform
Writer.new(data: data).perform
