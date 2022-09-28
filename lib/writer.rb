require 'csv'
require_relative 'file_finder.rb'

class Writer
    def initialize (data:)
        @data = data
        @header = @data.headers
    end

    def perform
        chose_col
        array_of_column
        write_new_csv
    end
    
    def chose_col
        puts "Voici les colonnes présente dans le fichier csv"
        count = 0
            @header.each do |header_name|
                puts "#{count} - #{header_name}" 
                count += 1                
            end
        puts "Quel colonne souhaite tu selectionner ?"
        choice_col = gets.chomp.split
        @new_headers = []
        choice_col.each {|header| @new_headers << header}       
    end

    def array_of_column
        length = @new_headers.length
        @array_length = []
        @count_all = @data.count
        count = 0
        number = 0
        length.times do
            @array_length << @data[0][@new_headers[0]]
            number += 1
        end
        # @data.each do |count|
        #     @array1 << [@data[count][@new_headers[0]],@data[count][@new_headers[1]]]
        #     count += 1
        # end
    end

    def write_new_csv
        CSV.open("db2/test.csv", "w+") do |csv|
            csv << @new_headers
            # @array1.each { |ok| csv << ok }
        end
    end
end

