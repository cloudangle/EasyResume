class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def show
    @resume = Resume.find(params[:id])
    @resumes = Resume.all
  end

  def new
    @resumes = Resume.all
    @resume = Resume.new
    @resume.build_selfintro
    @education = @resume.educations.build
    @education.details.build
    @exp = @resume.experiences.build
    @exp.details.build
    @work = @resume.works.build
    @work.details.build
  end

  def create
    @resume = Resume.new(resume_params)
    @resumes = Resume.all
    @selfintro = Selfintro.new
    if @resume.save
      flash[:notice] = 'Successfully created resume.'
      redirect_to @resume
    else
      puts @resume.errors.full_messages
      render 'new'
    end
  end

  def edit
    @resumes = Resume.all
    @resume = Resume.find(params[:id])
    @resume.build_selfintro unless @resume.selfintro
  end

  def update
    puts 'start update function'
    @resume = Resume.find(params[:id])
    puts 'ready to update'
    if @resume.update(resume_params)
      redirect_to @resume
    else
      puts @resume.errors.full_messages
      redirect_to new_resume_path
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:id,
                                   :resumeid,
                                   :description,
                                   selfintro_attributes: [:content],
                                   educations_attributes: [:id, :university, :major, :enrolledtime, :gradtime, :location, :_destroy, details_attributes: [:id, :detailable, :content, :_destroy]],
                                   experiences_attributes: [:id, :org, :desc, :starttime, :endtime, :location, :_destroy,details_attributes: [:id, :detailable, :content, :_destroy]],
                                   works_attributes: [:id, :title, :_destroy, details_attributes: [:id, :detailable, :content, :_destroy]])
  end
end
