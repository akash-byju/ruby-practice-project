class ApisController < ApplicationController
    
    before_action :authenticate_api_key
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





    private
     def authenticate_api_key
        api_key="hinjnjn" #our api_key
        request_api_key=params[:api_key] #user's api_key

        if(api_key!=request_api_key) #if  not match, authentication failed
            render json:{success:false, message: "unauthorized user"}, status: 404
        end

     end
  end
  