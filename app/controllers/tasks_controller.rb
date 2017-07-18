class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
#    if @project.save
      redirect_to project_path(@project.id)
#    else
#      render template: "projects/show"
#    end
  end
# Prefix            : project_tasks
# Verb              : POST
# URI Pattern       : /projects/:project_id/tasks(.:format)
# Controller#Action : tasks#create


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(params[:project_id])
  end

  def toggle
    render nothing: true
    @task = Task.find(params[:id])
    @task.done = !@task.done
    @task.save
  end

  private
  
    def task_params
      params[:task].permit(:title, :image)
    end
end