class ActivitiesController < ApplicationController
  def create
    @activity = Activity.new
    @activity["contact_id"] = params["activity"]["contact_id"]
    @activity["activity_type"] = params["activity"]["activity_type"]
    @activity["note"] = params["activity"]["note"]
    @activity.save
    redirect_to "/contacts/#{@activity["contact_id"]}"
  end
end
