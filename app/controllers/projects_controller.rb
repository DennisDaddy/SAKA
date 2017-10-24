class ProjectsController < ApplicationController
 before_action :logged_in_user, only: [:new, :create,:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    
     
  end

  def create
  @project = current_user.projects.build(micropost_params)
  if @project.save
  flash[:success] = "Project successfully created!"
  redirect_to projects_url
  else
    flash[:danger] = "Project not created fill all fields!"
    redirect_to request.referrer || root_url
  end
end


def edit
 @project = Project.find(params[:id])
end

def update
  
end

def update
  @project = Project.find(params[:id])
  if @project.update_attributes(micropost_params)
  flash[:success] = "Project successfully updated!"
  redirect_to @project
  else
  render 'edit'
  end
end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
   redirect_to @project
  end

  private

  def micropost_params
    params.require(:project).permit(:title, :content, :picture, :category_id, :project_goal)
  end

  def correct_user
  @project = current_user.projects.find_by(id: params[:id])
  redirect_to root_url if @project.nil?
  end
end
  