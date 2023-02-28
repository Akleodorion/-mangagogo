class MangasController < ApplicationController
  before_action :set_manga, only: %i[edit update]

  def new
    @manga = Manga.new
  end

  def edit; end

  def update
    @manga.update(manga_params)
    redirect_to manga_path(@manga)
  end

  private

  def manga_params
    params.require(:manga).permit(:saga, :volume)
  end

  def set_manga
    @manga = Manga.find(params[:id])
  end
end
