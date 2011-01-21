module Admin::ContactsHelper
  def responded_to(contact)
    if contact.respond?
      "Yes"
    else
      check_box_tag "contact[#{contact.id}][respond]", 1
    end
  end
end
