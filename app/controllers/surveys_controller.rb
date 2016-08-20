class SurveysController < ApplicationController
  def paper
		@question = Question.find(params[:id])
		@answers = Answer.where(question_id: params[:id]).sort
	end

  def next
		@user_info = User.find(1)

		if params[:check].nil? 

			flash[:alert] = "1개이상 선택해야합니다"
			redirect_to :back
	
		else
			@check_answers = Answer.find(params[:check])
			id = 0
			id = @check_answers.first.question_id
			@check_answers.each do |answer|
				p = Survey.new
				p.user_id = @user_info.id
				p.try_number = @user_info.try + 1
				p.question_id = answer.question_id
				p.answer_id = answer.id
				p.type_id = answer.type_id
				p.save
			end
			redirect_to "/surveys/paper/#{id+1}" 
		end	
  end

  def finish
  end

  def result
  end
end
