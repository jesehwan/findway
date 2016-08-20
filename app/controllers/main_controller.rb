class MainController < ApplicationController
  def home
  end

	def step
		@number = params[:id]
	end
end
