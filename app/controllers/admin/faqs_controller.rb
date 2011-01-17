class Admin::FaqsController < AdminController
  load_and_authorize_resource

  def index
    @faqs = Faq.order("position asc")
  end

  def reorder
    params[:faq].each do |k,v|
      faq = Faq.find(k)
      faq.update_attributes(v)
    end

    redirect_to admin_faqs_path
  end

  def new
  end

  def create
    if @faq.save
      redirect_to admin_faqs_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @faq.update_attributes(params[:faq])
      redirect_to admin_faqs_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @faq.destroy
    redirect_to admin_faqs_path, :notice => "FAQ successfully deleted."
  end
end
