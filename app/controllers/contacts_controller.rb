class ContactsController < ApplicationController
  before_action :find_all_contacts, except: [:destroy]

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to new_contact_path, notice: "Contact created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @contact = Contact.find(params.require(:id))
  end

  def update
    @contact = Contact.find(params.require(:id))

    if @contact.update(contact_params)
      redirect_to new_contact_path, notice: "Contact updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params.require(:id))
    @contact.destroy
    redirect_to new_contact_path, notice: "Contact removed", status: :see_other
  end

  private

    def contact_params
      params.require(:contact).permit!
    end

    def find_all_contacts
      @contacts = Contact.all
    end
end
