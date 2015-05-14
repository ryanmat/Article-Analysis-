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
		@user = User.find(session[:current_user])

		@article = Article.new({
			title: article_params[:title],
			author: article_params[:author],
			web_url: article_params[:web_url],
			comments: article_params[:comments],
			user_id: @user.id
			})

		if @article.save
			respond_to do |format|
				format.html {redirect_to user_path(@user.id)}
				format.json {render json: @article}
			end
		else
			respond_to do |format|
				format.html {render :new}
				format.json {render json: {error: 'Can not be created'}}
			end
		end
	end

	def destroy
		@user = User.find(session[:current_user])
		@article = Article.find(params[:id])
		@article.destroy

		respond_to do |format|
			format.html { redirect_to user_path(@user.id) }
			format.json { render json: @article }
		end
	end

	private 
	def article_params
		params.require(:article).permit(:title,:author,:web_url,:comments,:user_id)
	end

end