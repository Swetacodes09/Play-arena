class BookingsController < ApplicationController
  before_action :require_user
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
    @sports = Sport.all
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.update(status: 'cancelled')
    redirect_to bookings_url, notice: 'Booking was successfully cancelled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:sport_id, :date, :start_time, :end_time)
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'You need to log in to perform this action'
      redirect_to login_path
    end
  end

  def require_owner
    unless current_user == @booking.user
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to sports_path
    end
  end
end
