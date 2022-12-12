class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy like_book read_book]
  before_action :set_user, only: %i[like_book read_book]
  skip_before_action :require_login, only: %i[index show search]
  before_action :admin_access, only: %i[new create edit update destroy]
  before_action :current?, only: %i[read_book like_book]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
    comments_assoc_arr = Comment.where(book_id: @book.id).sort_by(&:created_at).to_a
    if comments_assoc_arr.empty?
      @book_comments = nil
    else
      min = comments_assoc_arr.min { |comment1, comment2| comment1.id <=> comment2.id }
      @book_comments = form_comments_tree(comments_assoc_arr, min.id)
    end
  end

  # GET /books/search
  def search
    @search_param = book_search_params[:book_name]
    @books_found = Book.where('name LIKE ?', "%#{@search_param}%").sort_by(&:name)
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
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    set_authors
    set_genres
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

  def like_book
    if book_liked_params[:already_liked] == 'true'
      like_id = Listuserlikedbook.find_by_book_id_and_user_id(@book.id, current_user.id).id
      Listuserlikedbook.destroy(like_id)
      respond_to do |format|
        format.html { redirect_to book_url(@book)}
        format.json { render :show, status: :created, location: @book }
      end
    else
      liked_book = Listuserlikedbook.new(user_id: current_user.id, book_id: @book.id)
      respond_to do |format|
        if liked_book.save
          format.html { redirect_to book_url(@book)}
          format.json { render :show, status: :created, location: @book }
        else
          format.html { redirect_to book_url(@book), alert: 'Something went wrong'}
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def read_book
    if book_read_params[:already_read] == 'true'
      read_id = Listuserreadbook.find_by_book_id_and_user_id(@book.id, current_user.id).id
      Listuserreadbook.destroy(read_id)
      respond_to do |format|
        format.html { redirect_to book_url(@book) }
        format.json { render :show, status: :created, location: @book }
      end
    else
      read_book = Listuserreadbook.new(user_id: current_user.id, book_id: @book.id)
      respond_to do |format|
        if read_book.save
          format.html { redirect_to book_url(@book)}
          format.json { render :show, status: :created, location: @book }
        else
          format.html { redirect_to book_url(@book), alert: 'Something went wrong'}
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
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
    params.require(:book).permit(:name, :description, :cover) # , authors_attributes: [:name], genres_attributes: [:name]
  end

  def book_authors_params
    params.require(:authors_attributes).map { |auth| auth.permit(:name) }
  end

  def book_genres_params
    params.require(:genres_attributes).map { |genre| genre.permit(:name) }
  end

  def book_search_params
    params.require(:search_request).permit(:book_name)
  end

  def book_liked_params
    params.require(:book_liked).permit(:already_liked)
  end

  def book_read_params
    params.require(:book_read).permit(:already_read)
  end

  def book_user_params
    params.require(:user).permit(:id)
  end

  def set_user
    @user = User.find(book_user_params[:id])
  end

  def set_authors
    book_authors_params.each do |author_name|
      next if author_name[:name].empty?

      author = Author.find_by_name(author_name[:name])
      next if @book.authors.exists?(author.id)

      @book.authors << author unless author.nil?
    end
  end

  def set_genres
    book_genres_params.each do |genre_name|
      p @book
      next if genre_name[:name].empty?

      p genre = Genre.find_by_name(genre_name[:name])
      p @book.genres.include?(genre)
      next if @book.genres.include?(genre) || genre.nil?

      @book.genres << genre
    end
  end

  def form_comments_tree(comments_arr, min_id, reply_to = nil)
    comments_arr.select { |com| com.reply_to_id == reply_to }
                .map do |child|
      node = child
      children = form_comments_tree(comments_arr, min_id, child.id)
      node = if children.empty?
               [node]
             else
               [node, children]
             end
      node
    end
  end
end
