class MeasurementsController < ApplicationController

  def index
    @measurements = Measurement.all
  end

  def new
    @measurement = Measurement.new
  end

  def edit
  @measurement = Measurement.find(params[:id])
  end

  def show
    @measurement = Measurement.find(params[:id])
  end

  def create
    @measurement = Measurement.new(measurement_params)

    if @measurement.save
    redirect_to @measurement
    else
    render 'new'
    end
  end

  def update
  @measurement = Measurement.find(params[:id])

  if @measurement.update(measurement_params)
    redirect_to @measurement
  else
    render 'edit'
  end
  end

  def destroy
  @measurement = Measurement.find(params[:id])
  @measurement.destroy

  redirect_to measurements_path
end

  private
  def measurement_params
    params.require(:measurement).permit(:fileName, :count, :binTime, :T, :C, :n,
                                                        :rpID, :x, :y, :z, :std)

end





end
