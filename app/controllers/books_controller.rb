class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def setup
    @books = Book.all
    @authors = Author.all
  end

  def cache_index
    #ActionController::Base.cache_store = :file_store, 'tmp/cache'
    setup
  end

  def no_cache_index
    setup
  end

  def query_cache_index
    setup
    @books2 = Book.all
    @books3 = Book.all
    @books4 = Book.all
    @books2.first
    @books3.first
    @books4.first
  end

  def show
    fresh_when last_modified: @book.updated_at.utc, etag: @book
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :price, :published_at, :publisher_id)
    end
end
