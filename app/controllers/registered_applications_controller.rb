class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  def index
    @registered_applications = RegisteredApplication.all
    authorize @registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])

    # In Syllabus but not used
    # @events = @registered_application.events.group_by(&:name)

    # My own grouping logic instead..
    @event_count = @registered_application.events.group(:name).count
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

    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registered_application.destroy
    respond_to do |format|
      format.html { redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.' }
      format.json { head :no_content }
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
