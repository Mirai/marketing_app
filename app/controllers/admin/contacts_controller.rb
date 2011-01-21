class Admin::ContactsController < AdminController
  load_and_authorize_resource

  def index
    @contacts = Contact.order("respond asc, created_at asc")
  end

  def mark_responded
    params[:contact].each do |k,v|
      contact = Contact.find(k)
      contact.update_attributes(v)
    end

    redirect_to admin_contacts_path
  end

  def show
  end

  def destroy
    @contact.destroy
    redirect_to admin_contacts_path
  end
end
