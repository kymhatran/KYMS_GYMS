class TrainersController < ApplicationController
  def index
    @trainers = policy_scope(Trainer)
    if params[:query].present?
      @trainers = @trainers.search_by_discipline_and_level(params[:query])
    else
      @trainers = @trainers.all
        @markers = @trainers.geocoded.map do |trainer|
      {
        lat: trainer.latitude,
        lng: trainer.longitude,
        info_window: render_to_string(partial: "/trainers/mapbox", locals: { trainer: trainer })
      }
      end
    end
    # # @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
    authorize @trainer
  end

  def create
    @user = current_user
    @trainer = Trainer.new(trainer_params)
    @trainer.user = @user
    authorize @trainer
    if @trainer.save
      redirect_to trainers_path(@trainer)
    else
      render :new
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
    authorize @trainer
  end

 def destroy
  @trainer = Trainer.find(params[:id])
  @trainer.destroy

  redirect_to user_path(current_user)
 end

  private

  def trainer_params
    params.require(:trainer).permit(:level, :discipline, :price, :about_me, :location)
  end
end
