class MainpageController < ApplicationController

  def index
    @resumes = Resume.all
  end

  def to_resume
    @resumes = Resume.all
    @resume = Resume.find_by(resumeid: params[:resumeid])
    if @resume
      redirect_to @resume
    else
      render 'index'
    end
  end

end
