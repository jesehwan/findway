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
	def rank
		@user_info = User.find(1)
		@number = params[:question_id].to_i
		@ranks = params[:rank]
		if @ranks.nil? 
			flash[:alert] = "순위를 선택해야합니다"
			redirect_to :back
		elsif !@ranks.has_value?("1")
			flash[:alert] = "1순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("2")	
			flash[:alert] = "2순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("3")	
			flash[:alert] = "3순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("4")	
			flash[:alert] = "4순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("5")
			flash[:alert] = "5순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("6")
			flash[:alert] = "6순위를 정해주세요"
			redirect_to :back
		else 
			@ranks.each do |answer, rank| 
				i = Answer.find(answer)
				p = Survey.new
				p.user_id = @user_info.id
				p.try_number = @user_info.try + 1
				p.question_id = i.question_id
				p.answer_id = i.id
				p.type_id = i.type_id
				p.rank = rank 
				p.save
			end
			redirect_to "/surveys/paper/#{@number+1}"
		end
	end

  def finish
		@user_info = User.find(1)

		@ranks = params[:rank]
		if @ranks.nil? 
			flash[:alert] = "순위를 선택해야합니다"
			redirect_to :back
		elsif !@ranks.has_value?("1")
			flash[:alert] = "1순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("2")	
			flash[:alert] = "2순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("3")	
			flash[:alert] = "3순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("4")	
			flash[:alert] = "4순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("5")
			flash[:alert] = "5순위를 정해주세요"
			redirect_to :back
		elsif !@ranks.has_value?("6")
			flash[:alert] = "6순위를 정해주세요"
			redirect_to :back
		elsif params[:check].nil? 
			flash[:alert] = "1개이상 선택해야합니다"
			redirect_to :back
 		else
			@ranks.each do |answer, rank| 
				i = Answer.find(answer)
				p = Survey.new
				p.user_id = @user_info.id
				p.try_number = @user_info.try + 1
				p.question_id = i.question_id
				p.answer_id = i.id
				p.type_id = i.type_id
				p.rank = rank 
				p.save
			end
			@check_answers = Answer.find(params[:check])
			@check_answers.each do |answer|
				p = Survey.new
				p.user_id = @user_info.id
				p.try_number = @user_info.try + 1
				p.question_id = answer.question_id + 1
				p.answer_id = answer.id
				p.type_id = answer.type_id
				p.save
			end
			redirect_to "/surveys/result" 
		end	
	
	end

  def result
		@result_survey = Survey.where(user_id: 1)
		p = User.find(1)
		p.try = p.try + 1
		p.save
  end
end
