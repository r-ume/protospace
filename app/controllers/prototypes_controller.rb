class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).all
  end

  # GET /prototypes/1.json
  def show
  end

  # GET /prototypes/new
  def new
    @prototype = Prototype.new
  end

  # GET /prototypes/1/edit
  def edit
  end

  def create
    @prototype = Prototype.new(prototype_params)

    respond_to do |format|
      if @prototype.save
        format.html { redirect_to @prototype, notice: 'Prototype was successfully created.' }
        format.json { render :show, status: :created, location: @prototype }
      else
        format.html { render :new }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prototype.update(prototype_params)
        format.html { redirect_to @prototype, notice: 'Prototype was successfully updated.' }
        format.json { render :show, status: :ok, location: @prototype }
      else
        format.html { render :edit }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prototype.destroy
    respond_to do |format|
      format.html { redirect_to prototypes_url, notice: 'Prototype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #def prototype_params
  #  params.fetch(:prototype, {})
  #end
end
