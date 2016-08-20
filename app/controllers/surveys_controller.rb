class SurveysController < ApplicationController
  def paper
		@question = Question.find(params[:id])
		@answers = Answer.where(question_id: params[:id]).sort
	end

  def next
		@check_answers = Answer.find(params[:check])


	
		
  end

  def finish
  end

  def result
  end
end
