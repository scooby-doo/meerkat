class UsedObjectsController < ApplicationController
  before_action :set_used_object, only: [:show, :edit, :update, :destroy]

  # GET /used_objects
  # GET /used_objects.json
  def index
    @used_objects = UsedObject.all
  end

  # GET /used_objects/1
  # GET /used_objects/1.json
  def show
    @used_object = UsedObject.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @used_object}
    end
  end

  # GET /used_objects/new
  def new
    @used_object = UsedObject.new
  end

  # GET /used_objects/1/edit
  def edit
    @used_object = UsedObject.find(params[:id])
  end

  # POST /used_objects
  # POST /used_objects.json
  def create
    @used_object = UsedObject.new(used_object_params)
    @used_object.user = current_user
    respond_to do |format|
      if @used_object.save
        if params[:supporting_files]
          params[:supporting_files].each { |file| 
            @used_object.supporting_files.create(file: file)
          }
        end
        format.html { redirect_to @used_object, notice: 'Used object was successfully created.' }
        format.json { render :show, status: :created, location: @used_object }
      else
        format.html { render :new }
        format.json { render json: @used_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /used_objects/1
  # PATCH/PUT /used_objects/1.json
  def update
    respond_to do |format|
      if @used_object.update(used_object_params)
        if params[:supporting_files]
          params[:supporting_files].each { |file| 
            @used_object.supporting_files.create(file: file)
          }
        end
        format.html { redirect_to @used_object, notice: 'Used object was successfully updated.' }
        format.json { render :show, status: :ok, location: @used_object }
      else
        format.html { render :edit }
        format.json { render json: @used_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /used_objects/1
  # DELETE /used_objects/1.json
  def destroy
    @used_object.destroy
    respond_to do |format|
      format.html { redirect_to used_objects_url, notice: 'Used object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_used_object
      @used_object = UsedObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def used_object_params
      params.require(:used_object).permit(
        :name, :description, :supporting_files)
    end
end
