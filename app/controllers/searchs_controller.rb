class SearchsController < ApplicationController
	def search
		@user_or_book = params[:option]
		@how_search = params[:choice]
		if @user_or_book == "1"
			@users = User.search(params[:search], @how_search, @user_or_book)
		else
			@books = Book.search(params[:search], @how_search, @user_or_book)
		end
	end

end
