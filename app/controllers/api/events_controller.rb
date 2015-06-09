class API::EventsController < ApplicationController
  # Skip CSRF protection in development
  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    # Try this for debugging
    else
      puts registered_application
      @event = registered_application.events.build(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end

  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
