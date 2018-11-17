class SurveysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :check_responsed, only:[:new_response, :create_response]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show    
    if current_user.id == @survey.user_id and @survey.profile.nil?
      flash[:alert] = "You have to create profile before sharing the survey"
      redirect_to new_profile_survey_path
    end   
  end

  # GET /surveys/new
   def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json 
      end 
end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = current_user.surveys.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



def new_response
@survey = Survey.find(params[:id])
@response = @survey.responses.build

    # now, the tricky part, you have to build the Answer objects so you can use the nested form later
    @survey.questions.each do |q|
      @response.answers.build question: q
    end
  end



def create_response
  @survey = Survey.find(params[:id])
  @response = @survey.responses.build(response_params)
  @response.user = current_user
  respond_to do |format|
          if @response.save
          format.html { redirect_to @survey, notice: 'Response was successfully submitted.' }
          format.json { render :show, status: :created, location: @survey }

      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
        end
    end  
end


def approve
  #authorize @survey
   @survey = Survey.find_by_id(params[:id])
   if @survey.approved?
      @survey.update_attribute(:approved, false)
      @survey.update_attribute(:reviewed, true)
       @survey.user.person.budget.increment!(:fbc_budget,  @survey.reward)
        @survey.decrement!(:reward,  @survey.reward)
    else
      @survey.user.person.budget.decrement!(:fbc_budget,  (@survey.tempreward - @survey.reward))
      @survey.increment!(:reward,  (@survey.tempreward - @survey.reward))
      @survey.update_attribute(:approved, true)
      @survey.update_attribute(:reviewed, true)

    end
    redirect_to surveys_review_path



end


def new_profile
@survey = Survey.find(params[:id])
@profile = @survey.build_profile

end

def create_profile
 @survey = Survey.find(params[:id])
  @profile = @survey.build_profile(profile_params)

  respond_to do |format|
          if @profile.save
          format.html { redirect_to @survey, notice: 'Survey Profile was successfully submitted.' }
          format.json { render :show, status: :created, location: @survey }

      else

        format.html { redirect_to new_profile_survey_url, notice: 'Survey Profile creating failed. please make sure about all fields.' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }


        end
    end  
  
end








def subregion_options
  render partial: 'subregion_select'
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:id,:name, :tempreward, :reward, :user_id, questions_attributes:[:id, :title, :qtype, :survey_id, options_attributes:[:id, :otext, :question_id]])
    end

def response_params
  params.require(:response).permit(answers_attributes:[:question_id, :option_id])  
end

def profile_params
   params.require(:profile).permit(:country_code, :state_code, :gender, :lang, :birthday)
  
end

def check_responsed
set_survey
if @survey.responses.exists?(user_id: current_user.id)
redirect_to root_path, alert: 'You have already answered the survey'
end

end








end
