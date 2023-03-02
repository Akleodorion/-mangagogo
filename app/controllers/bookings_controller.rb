class BookingsController < ApplicationController
  def new
    @manga = Manga.find(params[:manga_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @manga = Manga.find(params[:manga_id])
    @booking = Booking.new(booking_params)
    @booking.manga = @manga
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to manga_path(@manga)
      flash[:notice] = "Booking saved successfully"
    else
      render :new
    end
  end

  def destroy
  end

  def index
    @bookings = current_user.bookings_as_owner
    @waiting = []
    @accepted = []
    @denied = []
    @red = []
    @bookings.each do |element|
      if element[:red] == false
        if element[:pending].exist?
          element[:pending] == true ? @accepted << element : @denied << element
        else
          @waiting << element
        end
      else
        @red << element
      end
    end
  end

end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
