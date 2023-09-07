class ActivitiesController < ApplicationController
  before_action :set_challenge
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = @challenge.activities
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = @challenge.activities.build
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = @challenge.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to challenge_activity_url(@challenge, @activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to challenge_activity_url(@challenge, @activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream:
      turbo_stream.remove(helpers.dom_id(@activity).to_sym) }
    end
  end

  def activity_created(activity)
    @activity.activity_created

    respond_to do |format|
      if @activity.create
        format.turbo_stream {render turbo_stream: turbo_stream.replate(helpers.dom_id(@activity).to_sym, partial: 'activities/activity_listing',locals: { challenge: @challenge, activity: @activity }) }
        format.html { redirect_to chellenge_url(@challenge), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # def update_challenge_progress
  
  # def update_challenge_progress
  #   @activity.update_challenge_progress = params[:activity]
  #   respond_to do |format|
  #     if @activity.save
  #       format.turbo_stream { render turbo_stream: turbo_stream.replace(helpers.dom_id(@episode).to_sym, partial: 'activities/activity_listing', locals: { challenge: @challenge, activity: @activity }) }
  #       format.html { redirect_to chellenge_url(@challenge), notice: "Activity was successfully updated." }
  #       format.json { render :show, status: :ok, location: @activity }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @activity.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = @challenge.activities.find(params[:id])
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:note, :amount, :challenge_id)
    end
end
