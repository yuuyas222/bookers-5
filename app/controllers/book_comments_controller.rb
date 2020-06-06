class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        book_comment = BookComment.new(book_comment_params)
        book_comment.user_id = current_user.id
        book_comment.book_id = book.id
        book_comment.save
        redirect_back(fallback_location: request.path)
    end

    def destroy
        # book = Book.find(params[:book_id])#パラメータに渡す     
        # comment = BookComment.find(params[:id])
        # comment.destroy 
        BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        redirect_back(fallback_location: request.path)
    end
    # comment = BookComment.find(params[:book_id])#パラメータに渡す     
    # comment = BookComment.find(params[:id])
    # comment.destroy 



    private
    def book_comment_params
        params.require(:book_comment).permit(:comment,:book_id)
    end
end
