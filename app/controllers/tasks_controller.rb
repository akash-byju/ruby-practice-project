class TasksController < ApplicationController
  before_action :get_project
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.build(task_params)

      if @task.save
        redirect_to project_tasks_path(@project)
      else
        render :new

      end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    #  debugger
      if @task.update(task_params)
        redirect_to project_tasks_path(@project)
        #projects/8/tasks
      else
         render :edit 
      end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_to project_tasks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :status, :description)
    end

    def get_project
      puts params
      @project = Project.find(params[:project_id])
      # puts "nothing"
      # puts @project.id
    end
end
