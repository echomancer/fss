class ProducersController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /producers
  # GET /producers.json
  def index
    @producers = Producer.all
  end

  # GET /producers/1
  # GET /producers/1.json
  def show
  end

  # GET /producers/new
  def new
    @producer = Producer.new
  end

  # GET /producers/1/edit
  def edit
  end

  # POST /producers
  # POST /producers.json
  def create
    @producer = Producer.new(producer_params)
    @producer.name = @producer.name.downcase

    respond_to do |format|
      if @producer.save
        format.html { redirect_to new_food_path, notice: 'Producer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @producer }
      else
        flash[:error] = "Producer can't be an empty string."
        format.html { redirect_to new_food_path }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /producers/1
  # PATCH/PUT /producers/1.json
  def update
    respond_to do |format|
      if @producer.update(producer_params)
        format.html { redirect_to new_food_path, notice: 'Producer was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = "Producer can't be an empty string."
        format.html { redirect_to new_food_path }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producers/1
  # DELETE /producers/1.json
  def destroy
    @producer.destroy
    respond_to do |format|
      format.html { redirect_to new_food_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producer
      @producer = Producer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producer_params
      params.require(:producer).permit(:name)
    end
end