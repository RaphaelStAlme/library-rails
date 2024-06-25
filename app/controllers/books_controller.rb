class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books or /books.json
  def index
    @books = Book.all
    # Add rendering logic as needed, e.g., views or JSON response
  end

  # GET /books/:id or /books/:id.json
  def show
    # Add rendering logic as needed
  end

  # GET /books/new
  def new
    @book = Book.new
    # This action typically renders a form
  end

  # GET /books/:id/edit
  def edit
    # This action typically renders a form for editing
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      # Redirect or render as appropriate, e.g.:
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/:id or /books/:id.json
  def update
    if @book.update(book_params)
      # Redirect or render as appropriate, e.g.:
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/:id or /books/:id.json
  def destroy
    @book.destroy
    # Redirect or render as appropriate, e.g.:
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :description)
    end
end