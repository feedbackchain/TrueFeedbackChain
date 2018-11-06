class ResponsesController < ApplicationController

	def new		  
    load_survey  
	end


	def create
    	load_survey
    	@response = @survey.responses.build response_params
    	if @response.save
      	redirect_to edit_survey_response_path(@survey, @response)
    	else
      	render 'new', notice: "Please correct errors below."
    	end
  	end










private

	def load_survey
    @survey = Survey.find params[:survey_id]
	end



  def response_params
    params.require(:response).permit! if params[:response]
  end










end