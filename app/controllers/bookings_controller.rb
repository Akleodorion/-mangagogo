class BookingsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def index
    @bookings = Booking.where(manga.user == curent_user)
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
