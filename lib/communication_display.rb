
class CommunicationDisplay
    def self.perform
        introduction
        show_files
    end
    def self.introduction
        p "Bienvenue sur mon super CSV"        
    end
    def self.show_files
        p "Voici une liste des fichiers csv"
    end
end
