class SurveysController < ApplicationController
  def paper
		@question = Question.find(params[:id])

	end

  def next
  end

  def finish
  end

  def result
  end
end
