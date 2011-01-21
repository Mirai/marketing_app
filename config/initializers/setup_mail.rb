ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "cadevent.com",  
  :user_name            => "admin@cadevent.com",  
  :password             => "pass*123",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  

}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
