class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactMailer.thank_you(@contact).deliver
      ContactMailer.new_contact(@contact).deliver
      redirect_to thank_you_path
    else
      render :action => 'new'
    end
  end
end
