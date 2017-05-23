class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end
  
  def edit 
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:project_id])
  end
  
  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:project_id])
    @task.destroy

    redirect_to project_path(@project)
  end
 
    private
      def task_params
        params.require(:task).permit(:id, :description, :av_duration, :max_duration, :toc_factor, :completed, :due_date, :project_id)
      end
end
