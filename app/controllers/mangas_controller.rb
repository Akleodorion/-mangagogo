class MangasController < ApplicationController
  before_action :set_manga, only: %i[edit update]

  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new(manga_params)
    @manga.user = current_user
    if @manga.save
      redirect_to manga_path(@manga)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    #TODO
  end

  def update
    @manga.update(manga_params)
    redirect_to manga_path(@manga)
   end
   
  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to mangas_path, status: :see_other
  end

  def index
    @manga = Manga.all
  end

  private

  def manga_params
    params.require(:manga).permit(:saga, :description, :picture, :volume)
  end

  def set_manga
    @manga = Manga.find(params[:id])
  end
end
