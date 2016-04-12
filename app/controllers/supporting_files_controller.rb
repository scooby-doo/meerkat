class SupportingFilesController < ApplicationController
  def index
    @project = project.find(params[:project_id])
    @supporting_files = @project.supporting_files
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supporting_files }
    end
  end

  def show
    @supporting_file = SupportingFile.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supporting_file}
    end
  end

  def new
    @project = project.find(params[:project_id])
    @supporting_file = @project.supporting_files.build
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supporting_file}
    end
  end

  def edit
    @supporting_file = SupportingFile.find(params[:id])
  end

  def create
    @supporting_file = SupportingFile.new(params[:supporting_file])
    if @supporting_file.save
      respond_to do |format|
        format.html {
          render :json => [@supporting_file.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@supporting_file.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @project = Project.find(params[:project_id])

    @supporting_file = @project.pictures.find(params[:id])

    respond_to do |format|
      if @supporting_file.update_attributes(supporting_file_params)
        format.html { redirect_to project_path(@project), notice: 'File was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supporting_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    type = params[:owner_type]

    @supporting_file = SupportingFile.find(params[:id])
    @supporting_file.destroy

    respond_to do |format|
      case type
      when 'project'
        @project = Project.find(params[:owner_id])
        format.html { redirect_to project_path(@project), notice: 'File was removed' }
      when 'used_object'
        @used_object = UsedObject.find(params[:owner_id])
        format.html { redirect_to used_object_path(@used_object), notice: 'File was removed' }
      end
      format.js
    end
  end

  private

  def supporting_file_params
    params.require(:supporting_file).permit(:description, :project_id, :file)
  end
end
