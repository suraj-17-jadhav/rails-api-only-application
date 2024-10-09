class Document< ApplicationRecord
    belongs_to :user
    has_many_attached :files
  
  
    require 'securerandom'
    require 'fileutils'
    def self.upload(_file, _user_id, file_context)
      directory = _user_id.to_s
      directory_path = "/home/suraj/Desktop/FinalTask/#{directory}"
      formatted_file_name = _file.original_filename.to_s.delete("^a-zA-Z0-9._")
      file_extension = File.extname(formatted_file_name).downcase
      file_name = SecureRandom.uuid + file_extension
      file_location = "#{directory_path}/#{file_name}"
      file_type = File.extname(formatted_file_name).to_s.downcase
      FileUtils.mkdir_p(directory_path, mode: 0777)
      FileUtils.cp(_file.path, "#{directory_path}/#{file_name}")
    
      documents = Document.new(
        user_id: _user_id,
        name: formatted_file_name,
        file_name: formatted_file_name,
        file_type: file_type,
        file_location: file_location,
        file_context: file_context
      )
    #   binding.pry
      documents.save
    
      documents
    end
  end
  