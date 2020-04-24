class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @event = Event.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = set_event
    # @invitation = Invitation.all
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :place, :date, :creator_id)
  end

end