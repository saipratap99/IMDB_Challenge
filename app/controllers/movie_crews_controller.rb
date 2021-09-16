class MovieCrewsController < ApplicationController
  before_action :set_movie_crew, only: %i[ show edit update destroy ]

  # GET /movie_crews or /movie_crews.json
  def index
    @movie_crews = MovieCrew.all
  end

  # GET /movie_crews/1 or /movie_crews/1.json
  def show
  end

  # GET /movie_crews/new
  def new
    @movie_crew = MovieCrew.new
  end

  # GET /movie_crews/1/edit
  def edit
  end

  # POST /movie_crews or /movie_crews.json
  def create
    @movie_crew = MovieCrew.new(movie_crew_params)

    respond_to do |format|
      if @movie_crew.save
        format.html { redirect_to @movie_crew, notice: "Movie crew was successfully created." }
        format.json { render :show, status: :created, location: @movie_crew }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_crews/1 or /movie_crews/1.json
  def update
    respond_to do |format|
      if @movie_crew.update(movie_crew_params)
        format.html { redirect_to @movie_crew, notice: "Movie crew was successfully updated." }
        format.json { render :show, status: :ok, location: @movie_crew }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_crews/1 or /movie_crews/1.json
  def destroy
    @movie_crew.destroy
    respond_to do |format|
      format.html { redirect_to movie_crews_url, notice: "Movie crew was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_crew
      @movie_crew = MovieCrew.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_crew_params
      params.require(:movie_crew).permit(:movie_id, :cast_crew_detail_id, :department_id)
    end
end
