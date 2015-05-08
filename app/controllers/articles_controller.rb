class ArticlesController < ApplicationController

	def index
		@articles = Article.all

		respond_to do |format|
			format.html {}
			format.json {render json: @articles}
			end 
	end

	def show
		@article = Article.find(params[:id])
		respond_to do |format|
			format.html {}
			format.json {render json: @article}
		end
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			respond_to do |format|
				format.html {redirect_to article_path}
				format.json {render json: @article}
			end
		else
			respond_to do |format|
				format.html {render :new}
				format.json {render json: {error: 'Can not be created'}}
			end
		end
	end

	private 
	def article_params
		params.require(:article).permit(:title,:author,:web_url,:comments,:user_id)
	end

end