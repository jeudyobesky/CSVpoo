require 'csv'

class FileFinder
    def initialize (folder:)
        @folder = folder
        @array_of_file = []
    end

    def perform
        folder_content
        choose_file
        read_file
    end

    private

    def folder_content
        count = 0
        @folder.each do |file|
            test_file = file.gsub('./db/','').gsub('_',' ').capitalize           
            @array_of_file << file
            puts "#{count} - #{test_file}"
            count += 1
        end
    end

    def choose_file
        puts "Quel csv souhaite tu selectionner ?"
        csv_choose = gets.chomp.to_i
        @chosen_csv = @array_of_file[csv_choose]
    end

    def rename_file
        @chosen_csv.gsub('./db/','').gsub('_',' ').gsub('.csv','').capitalize
    end

    def read_file
        @table =CSV.parse(File.read("#{@chosen_csv}"), headers: true)
        @csv_header = @table.headers
        return @table
    end
end

