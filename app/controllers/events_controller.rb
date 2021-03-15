class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  before_action :authorize, only: %i[new]
  helper_method :invite_path

  def invite_path(event, new_attendee)
    "/events/#{event.id}/invite?new_attendee=#{new_attendee.id}"
  end

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  # Exclude current attendees and the event creator from the all the users,
  # the result is a list of the people that is possible to invite to the event.
  # The equivalent query:
  # select users.name
  # from users
  # where users.name not in
  #       (select u.name
  #        from events
  #                 join users_events ue on events.id = ue.event_id
  #                 join users u on u.id = ue.user_id
  #        where events.id = :current_event)
  # and users.name != :event_creator_name
  def show
    @attendees = Event.joins(:attendees)
      .where(events: { id: @event.id })
      .select('users.name')

    @possible_attendees = User.where.not(name: @attendees)
      .and(User.where.not(name: current_user_name))
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite
    event_id = params[:id]
    event = Event.find event_id
    new_attendee = User.find params[:new_attendee]
    event.attendees << new_attendee
    redirect_to event_path id: event_id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

  def authorize
    unless user_signed_in?
      flash[:error] = 'Login before creating an Event'
      redirect_to root_url
    end
  end
end
