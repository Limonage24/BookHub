class ListbookgenresController < ApplicationController
  before_action :set_listbookgenre, only: %i[ show edit update destroy ]

  # GET /listbookgenres or /listbookgenres.json
  def index
    @listbookgenres = Listbookgenre.all
  end

  # GET /listbookgenres/1 or /listbookgenres/1.json
  def show
  end

  # GET /listbookgenres/new
  def new
    @listbookgenre = Listbookgenre.new
  end

  # GET /listbookgenres/1/edit
  def edit
  end

  # POST /listbookgenres or /listbookgenres.json
  def create
    @listbookgenre = Listbookgenre.new(listbookgenre_params)

    respond_to do |format|
      if @listbookgenre.save
        format.html { redirect_to listbookgenre_url(@listbookgenre), notice: "Listbookgenre was successfully created." }
        format.json { render :show, status: :created, location: @listbookgenre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listbookgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listbookgenres/1 or /listbookgenres/1.json
  def update
    respond_to do |format|
      if @listbookgenre.update(listbookgenre_params)
        format.html { redirect_to listbookgenre_url(@listbookgenre), notice: "Listbookgenre was successfully updated." }
        format.json { render :show, status: :ok, location: @listbookgenre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listbookgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listbookgenres/1 or /listbookgenres/1.json
  def destroy
    @listbookgenre.destroy

    respond_to do |format|
      format.html { redirect_to listbookgenres_url, notice: "Listbookgenre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listbookgenre
      @listbookgenre = Listbookgenre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listbookgenre_params
      params.require(:listbookgenre).permit(:book_id, :genre_id)
    end
end
