class MovieCastsController < ApplicationController
  before_action :set_movie_cast, only: %i[ show edit update destroy ]

  # GET /movie_casts or /movie_casts.json
  def index
    @movie_casts = MovieCast.all
  end

  # GET /movie_casts/1 or /movie_casts/1.json
  def show
  end

  # GET /movie_casts/new
  def new
    @movie_cast = MovieCast.new
  end

  # GET /movie_casts/1/edit
  def edit
  end

  # POST /movie_casts or /movie_casts.json
  def create
    @movie_cast = MovieCast.new(movie_cast_params)

    respond_to do |format|
      if @movie_cast.save
        format.html { redirect_to @movie_cast, notice: "Movie cast was successfully created." }
        format.json { render :show, status: :created, location: @movie_cast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_casts/1 or /movie_casts/1.json
  def update
    respond_to do |format|
      if @movie_cast.update(movie_cast_params)
        format.html { redirect_to @movie_cast, notice: "Movie cast was successfully updated." }
        format.json { render :show, status: :ok, location: @movie_cast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_casts/1 or /movie_casts/1.json
  def destroy
    @movie_cast.destroy
    respond_to do |format|
      format.html { redirect_to movie_casts_url, notice: "Movie cast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_cast
      @movie_cast = MovieCast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_cast_params
      params.require(:movie_cast).permit(:role_name, :movie_id, :cast_crew_detail_id)
    end
end
