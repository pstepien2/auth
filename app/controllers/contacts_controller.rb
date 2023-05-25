class ContactsController < ApplicationController

  def show
    @contact = Contact.find_by({ "id" => params["id"] })
    @company = Company.find_by({ "id" => @contact["company_id"] })
    @activities = Activity.where({ "contact_id" => @contact["id"] })
    @activity = Activity.new
    @activity["contact_id"] = @contact["id"]
  end

  def new
    @contact = Contact.new
    @company = Company.find_by({ "id" => params["company_id"] })
    @contact["company_id"] = @company["id"]
  end

  def create
    @contact = Contact.new
    @contact["first_name"] = params["contact"]["first_name"]
    @contact["last_name"] = params["contact"]["last_name"]
    @contact["email"] = params["contact"]["email"]
    @contact["phone_number"] = params["contact"]["phone_number"]
    @contact["company_id"] = params["contact"]["company_id"]
    @contact.save
    redirect_to "/companies/#{@contact["company_id"]}"
  end

  def edit
    @contact = Contact.find_by({ "id" => params["id"] })
  end
  
  def update
    @contact = Contact.find_by({ "id" => params["id"] })
    @contact["first_name"] = params["contact"]["first_name"]
    @contact["last_name"] = params["contact"]["last_name"]
    @contact["email"] = params["contact"]["email"]
    @contact["phone_number"] = params["contact"]["phone_number"]
    @contact["company_id"] = params["contact"]["company_id"]
    @contact.save
    redirect_to "/contacts/#{@contact["id"]}"
  end

  def destroy
    @contact = Contact.find_by({ "id" => params["id"] })
    @contact.destroy
    redirect_to "/companies/#{@contact["company_id"]}"
  end

end