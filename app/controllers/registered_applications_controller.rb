class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role == 'admin'
      @registered_applications = RegisteredApplication.all
    else
      @registered_applications = current_user.registered_applications
    end
    authorize @registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])

    # In Syllabus but not used
    @events = @registered_application.events.group_by {|event| event.name}

    @event_count = @events.count

    # My own grouping logic instead..
    #@event_count = @registered_application.events.group(:name, :created_at).count
  end

  def new
    @registered_application = RegisteredApplication.new
    authorize @registered_application
  end

  def edit
    authorize @registered_application
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    authorize @registered_application

    if @registered_application.save
      flash[:notice] = "Application was saved."
      redirect_to @registered_application
    else
      flash[:error] = "We couldn't save your application information."
      render :new
    end
  end

  def update
    authorize @registered_application

    if @registered_application.update(registered_application_params)
      flash[:notice] = "Application was updated."
      redirect_to @registered_application
    else
      flash[:error] = "We couldn't update your application information."
      render :edit
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] = "Application was destroyed"
      redirect_to registered_applications_url
    else
      flash[:error] = "We couldn't destroy your application."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registered_application_params
      params.require(:registered_application).permit(:url, :user, :title)
    end
end
