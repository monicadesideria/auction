namespace :scheduler do
  desc 'Task run daily'
  task daily: :environment do
    BidCheckerJob.perform_later
  end
end