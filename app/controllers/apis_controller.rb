class ApisController < ApiController

  #to use these format we must include the apipie to our gemfile and then install apipie
  #link: https://github.com/Apipie/apipie-rails
  api :GET, "apis/all", 'api to fetch all projects and their tasks'
  description 'api to fetch all projects and their tasks'

  def index
      @projects=Project.all

      response={}
      @projects.each do |project|
        list_of_tasks=[]

        project.tasks.each do |task|
          cur_task={}
          cur_task["task_name"]=task.title
          cur_task["task_status"]=task.status
          list_of_tasks.push(cur_task)    #appending current_task to the list of tasks
        end

      project_name="project_#{project.id}" 
      response[project_name]=list_of_tasks #project_id to tasks mapping
      end

      render json: {success: true, response: response}, status: 200
  end

end
  