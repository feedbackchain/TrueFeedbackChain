class ResponsesController < ApplicationController



	def create
		
    	@response = current_user.responses.build(response_params)
    	if @response.save
      	redirect_to root, notice: "Yay! You voted on survey."
    	else
      	redirect_to root_path, notice: "Please correct errors below."
    	end
  	end










private

	def load_survey
    @survey = Survey.find(params[:id])
	end



  def response_params
    params.require(:survey).permit(:id,responses_parameters: [:id, :user_id, :survey_id, answers_attributes:[:question_id, :response_id, :option_id ]] )
  end










end