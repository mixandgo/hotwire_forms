class ContactsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :find_all_contacts
  before_action :find_contact, except: [:new, :create, :index]

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Contact created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      flash[:notice] = "Contact updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = "Contact removed"
    render turbo_stream: [
      turbo_stream.update("flash", partial: "shared/flash"),
      turbo_stream.remove(dom_id(@contact)),
      turbo_stream.update("contacts-count", partial: "contacts/count", locals: { contacts: @contacts })
    ]
  end

  private

    def contact_params
      params.require(:contact).permit!
    end

    def find_all_contacts
      @contacts = Contact.all
    end

    def find_contact
      @contact = Contact.find(params.require(:id))
    end
end
