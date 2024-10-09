# Set the environment
set :environment, 'development' # Change to 'production' in production environment

# Schedule Reminder Job
# every 1.day, at: '1:00 pm' do
#   runner "Reminder.send_document_upload_reminders"
# end

# clear crone: crontab -r
# update crone: whenever --update-crontab
#update cron development: whenever --update-crontab --set environment='development'
set :output, './log/cron.log'

# every 1.minutes do
#   runner "puts Time.now"
#   runner "puts 'hello,world'"
# end

every 1.day, at: '1:00 pm' do
  runner "Reminder.send_document_upload_reminders"
end