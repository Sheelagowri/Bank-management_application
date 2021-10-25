class BooksController < ApplicationController
 
  before_action :set_book, only: %i[ show edit update destroy ] # set_book method is called before show, edit, update and destroy method.

  # GET /books or /books.json
  def index
    @books = Book.all # assigning all the books in a single variable called '@books', which is used to display all books
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new # create new book 
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params) # creates new book with book params

    respond_to do |format|
      if @book.save 
        format.html { redirect_to @book, notice: "Book was successfully created." } #response for HTML request, redirects to show page with a notice "book was created sucessfully"
        format.json { render :show, status: :created, location: @book } # response for JSON request, render show page with status "created".
      else
        format.html { render :new, status: :unprocessable_entity } #response for HTML request, render new method
        format.json { render json: @book.errors, status: :unprocessable_entity }  # response for JSON request, render show method with error for unprocessable_entity".
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." } #response for HTML request, redirects to show page with a notice "book was sucessfully updated"
        format.json { render :show, status: :ok, location: @book } # response for JSON request, render show page with status "ok".
      else
        format.html { render :edit, status: :unprocessable_entity }#response for HTML request, render edit method
        format.json { render json: @book.errors, status: :unprocessable_entity }# response for JSON request, render show method with error for unprocessable_entity".
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy # to delete a particular book
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." } #response for HTML request, redirects to index page with a notice "book was sucessfully destroyed"
      format.json { head :no_content } # response for JSON request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id]) #find the particular book using id.
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :creation_date, :content, :category_id, :image) # books params which is required to create a book. 
    end
end
