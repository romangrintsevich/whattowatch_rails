class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: :index
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /shows or /shows.json
  def index
    @shows = Show.all

    def redirect
      redirect_to home_about_path, notice: "If you want to try this application, you can sign up!"
    end
  end

  # GET /shows/1 or /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    #@show = Show.new
    @show = current_user.shows.build
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows or /shows.json
  def create

    #@show = Show.new(show_params)
    @show = current_user.shows.build(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to show_url(@show), notice: "Show was successfully created." }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1 or /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to show_url(@show), notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1 or /shows/1.json
  def destroy
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @show = current_user.shows.find_by(id: params[:id])
    redirect_to shows_path, notice: "Not authorizes to Edit this show!" if @show.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:name, :link, :priority, :description, :user_id)
    end
end
