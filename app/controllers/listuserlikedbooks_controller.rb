class ListuserlikedbooksController < ApplicationController
  before_action :set_listuserlikedbook, only: %i[ show edit update destroy ]

  # GET /listuserlikedbooks or /listuserlikedbooks.json
  def index
    @listuserlikedbooks = Listuserlikedbook.all
  end

  # GET /listuserlikedbooks/1 or /listuserlikedbooks/1.json
  def show
  end

  # GET /listuserlikedbooks/new
  def new
    @listuserlikedbook = Listuserlikedbook.new
  end

  # GET /listuserlikedbooks/1/edit
  def edit
  end

  # POST /listuserlikedbooks or /listuserlikedbooks.json
  def create
    @listuserlikedbook = Listuserlikedbook.new(listuserlikedbook_params)

    respond_to do |format|
      if @listuserlikedbook.save
        format.html { redirect_to listuserlikedbook_url(@listuserlikedbook), notice: "Listuserlikedbook was successfully created." }
        format.json { render :show, status: :created, location: @listuserlikedbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listuserlikedbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listuserlikedbooks/1 or /listuserlikedbooks/1.json
  def update
    respond_to do |format|
      if @listuserlikedbook.update(listuserlikedbook_params)
        format.html { redirect_to listuserlikedbook_url(@listuserlikedbook), notice: "Listuserlikedbook was successfully updated." }
        format.json { render :show, status: :ok, location: @listuserlikedbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listuserlikedbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listuserlikedbooks/1 or /listuserlikedbooks/1.json
  def destroy
    @listuserlikedbook.destroy

    respond_to do |format|
      format.html { redirect_to listuserlikedbooks_url, notice: "Listuserlikedbook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listuserlikedbook
      @listuserlikedbook = Listuserlikedbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listuserlikedbook_params
      params.require(:listuserlikedbook).permit(:book_id, :user_id)
    end
end
