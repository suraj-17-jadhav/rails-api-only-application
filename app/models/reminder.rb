class Reminder < ApplicationRecord
    belongs_to :user
  
    def self.create_document_upload_reminder(user)
      reminder_date = Date.today + 1.day
      message = "Upload documents for #{user.name}"
      Reminder.create(user: user, reminder_date: reminder_date, message: message)
    end

    def self.send_document_upload_reminders
        reminders = Reminder.where(reminder_date: Date.today)
        reminders.each do |reminder|
          puts "Reminder: #{reminder.message}"
        end
    end

end