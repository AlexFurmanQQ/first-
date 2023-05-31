class SentEmailCreateUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    email = args[0]
    UserMailer.with(email: email).email_conformation.deliver_now
  end
end
