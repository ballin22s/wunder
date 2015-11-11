class ApplicationMailer < ActionMailer::Base
  #Default Email
  default from: "clickoncomics@gmail.com"
  layout 'mailer'
end