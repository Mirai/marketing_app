class ContactMailer < ActionMailer::Base
  def thank_you(contact)
    @contact = contact
    mail(:to => contact.email, :subject => "Thank You for Contacting CadEvent", :from => "admin@cadevent.com")  
  end

  def new_contact(contact)
    @contact = contact
    mail(:to => "robert.miner@cadevent.com", :subject => "New Contact for CadEvent", :from => contact.email)
  end
end
