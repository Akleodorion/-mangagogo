class MangasController < ApplicationController
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

  private

  def manga_params
    params.require(:manga).permit(:saga, :description, :volume, :photo)
  end
end
