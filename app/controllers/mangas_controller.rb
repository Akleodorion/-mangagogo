class MangasController < ApplicationController
  before_action :set_manga, only: %i[edit update]

  def new
    @manga = Manga.new
    authorize @manga
  end

  def create
    @manga = Manga.new(manga_params)
    @manga.user = current_user
    authorize @manga
    if @manga.save!
      redirect_to manga_path(@manga)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @manga = Manga.find(params[:id])
    authorize @manga
    @booking = Booking.new
  end

  def edit
    authorize @manga
  end

  def update
    authorize @manga
    @manga.update(manga_params)
    redirect_to manga_path(@manga)
  end

  def destroy
    @manga = Manga.find(params[:id])
    authorize @manga
    @manga.destroy
    redirect_to mangas_path, status: :see_other
  end

  def index
    @mangas = policy_scope(Manga)
    # cette ligne permet de passer le conflit avec la policy scope
    if params[:query] == "" || params[:query].nil?
      @query = Manga.all
    else
      @query = Manga.search_by_saga_and_description(params[:query])
    end
  end

  private

  def manga_params
    params.require(:manga).permit(:saga, :description, :volume, :photo)
  end

  def set_manga
    @manga = Manga.find(params[:id])
  end
end
