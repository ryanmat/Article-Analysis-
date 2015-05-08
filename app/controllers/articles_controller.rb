class ArticlesController < ApplicationController

	def index
		@articles = Article.all

		respond_to do |format|
			format.html {}
			format.json {render json: @articles}
			end 
	end

	


end