class ApiController < ApplicationController

    before_action :authenticate_api_key
    def authenticate_api_key
        api_key=Rails.configuration.constants.api_key  #our api_key
        request_api_key=params[:api_key] #user's api_key

        if(api_key!=request_api_key) #if  not match, authentication failed
            render json:{success:false, message: "unauthorized user"}, status: 404
        end

     end
end
  