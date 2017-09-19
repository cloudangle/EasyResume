class SelfintrosController < ApplicationController
  def create
    @resume = Resume.find(params[:resume_id])
    @selfintro = @resume.create_selfintro(selfintro_params)
    if @selfintro.save
      respond_to do |format|
        format.js
      end
    else
      render 'resumes/show'
    end
  end

  def update
    @resume = Resume.find(params[:resume_id])
    @selfintro = @resume.selfintro
    if @selfintro.update(selfintro_params)
      respond_to do |format|
        format.js
      end
    else
      render 'resumes/show'
    end
  end

  private
  def selfintro_params
    params.require(:selfintro).permit(:content)
  end
end
