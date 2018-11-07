class AnswersController < ApplicationController
def create
@question = Question.find_by_id(params[:question][:id])
@options = @question.options
@option = @options.option.find_by_id(params[:option][:id])
current_user.answers.create({option_id: @option.id}
end




end