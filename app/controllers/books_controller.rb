class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :check]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @randam_book = @books.sample
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @books = Book.all
    @randam_book = @books.sample
  end

  def check
    @books = Book.all
    @randam_book = @books.sample
      respond_to do |format|
        format.json
    end
  end
  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:question,:answer)
    end
end
