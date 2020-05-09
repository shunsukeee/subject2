class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book.id)
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find(params[:id])
	 if	comment.destroy
		redirect_back(fallback_location: root_path)
	 else
		render :show
	 end
    end

	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end
end
