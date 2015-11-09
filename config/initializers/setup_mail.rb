ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 =>  587,
  :domain               => "http://0.0.0.0:3000",
  :user_name            => "clickoncomics@gmail.com",
  :password             => "pgpdqbmffqjvsoou",
  :authentication       => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://0.0.0.0:3000"