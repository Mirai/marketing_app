class FaqsController < ApplicationController
  def index
    @faqs = Faq.order("position asc")
  end

end
