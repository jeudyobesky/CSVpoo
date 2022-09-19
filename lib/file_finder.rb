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
        chosen_csv = @array_of_file[csv_choose]
        @chosen_csv = chosen_csv
    end

    def read_file
        @table =CSV.parse(File.read("#{@chosen_csv}"), headers: true)
        @csv_header = @table.headers
    end

    def chose_col
        puts "Voici les colonnes présente dans le fichier csv -#{rename_file}"
        count = 0
            @csv_header.each do |header_name|
                puts "#{count} - #{header_name}" 
                count += 1                
            end
        puts "Quel colonne souhaite tu selectionner ?"
        choice_col = gets.chomp.split
        @headers = []
        @array1 = []
        choice_col.each {|header| headers << header}       
    end
    
    def generate_array

        # length.times do |number|
        #     @array_length << @table[count][@headers[number]
        #     number += 1
        # end
    end

    def array_of_column
        length = @headers.length
        @array_length = []
        @count_all = @table.count
        count = 0
        number = 0
        length.times do
            @array_length << @table[count][@headers[number]]
            number += 1
        end
        count_all.times do |count|
            @array1 << [@table[count][@headers[0]],@table[count][@headers[1]]]
        end
    end


    def write_new_csv
        CSV.open("db2/#{rename_file}.csv", "w+") do |csv|
            csv << @headers
            @array1.each { |ok| csv << ok }
        end
    end

    def rename_file
        @chosen_csv.gsub('./db/','').gsub('_',' ').gsub('.csv','').capitalize
    end
end

