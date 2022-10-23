class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end
  
  # POST /spices
  def create
    spice = Spice.create(spices_params)
    render json: spice, status: :created
  end
  
  
  # # GET /spices/:id
  # def show
  #   spice = find_spice
  #   render json: spice
  # end
  
  # PATCH/PUT /spices/:id
  def update
    spice = find_spice
    spice.update(spices_params)
    render json: spice
  end

  # DELETE /spices/:id
  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
    # render json: {}
  end

  private

  def spices_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_spice
    Spice.find(params[:id])
  end

  def render_not_found_response
    render json: { "error": "Spice not found" }
  end

end