class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  # skip_before_action :require_login, only: %i[index show]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show; end

  # GET /books/search
  def search
    @books_found = Book.where("name LIKE ?", "%#{book_search_params[:book_name]}%").sort_by(&:name)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    set_authors
    set_genres

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        p @book.errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
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
    p params.require(:book).permit(:name, :description, :cover) # , authors_attributes: [:name], genres_attributes: [:name]
  end

  def book_authors_params
    params.require(:authors_attributes).map { |auth| auth.permit(:name) }
  end

  def book_genres_params
    params.require(:genres_attributes).map { |genre| genre.permit(:name) }
  end

  def book_search_params
    p params.require(:search_request).permit(:book_name)
  end

  def set_authors
    book_authors_params.each do |author_name|
      next if author_name[:name].empty?

      author = Author.find_by_name(author_name[:name])
      if author.nil?
        @book.authors << Author.new(name: author_name[:name])
      else
        @book.authors << author
      end
    end
  end

  def set_genres
    book_genres_params.each do |genre_name|
      next if genre_name[:name].empty?

      genre = Genre.find_by_name(genre_name[:name])
      if genre.nil?
        @book.genres << Genre.new(name: genre_name[:name])
      else
        @book.genres << genre
      end
    end
  end
end
