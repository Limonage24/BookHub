class ListbookauthorsController < ApplicationController
  before_action :set_listbookauthor, only: %i[ show edit update destroy ]

  # GET /listbookauthors or /listbookauthors.json
  def index
    @listbookauthors = Listbookauthor.all
  end

  # GET /listbookauthors/1 or /listbookauthors/1.json
  def show
  end

  # GET /listbookauthors/new
  def new
    @listbookauthor = Listbookauthor.new
  end

  # GET /listbookauthors/1/edit
  def edit
  end

  # POST /listbookauthors or /listbookauthors.json
  def create
    @listbookauthor = Listbookauthor.new(listbookauthor_params)

    respond_to do |format|
      if @listbookauthor.save
        format.html { redirect_to listbookauthor_url(@listbookauthor), notice: "Listbookauthor was successfully created." }
        format.json { render :show, status: :created, location: @listbookauthor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listbookauthor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listbookauthors/1 or /listbookauthors/1.json
  def update
    respond_to do |format|
      if @listbookauthor.update(listbookauthor_params)
        format.html { redirect_to listbookauthor_url(@listbookauthor), notice: "Listbookauthor was successfully updated." }
        format.json { render :show, status: :ok, location: @listbookauthor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listbookauthor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listbookauthors/1 or /listbookauthors/1.json
  def destroy
    @listbookauthor.destroy

    respond_to do |format|
      format.html { redirect_to listbookauthors_url, notice: "Listbookauthor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listbookauthor
      @listbookauthor = Listbookauthor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listbookauthor_params
      params.require(:listbookauthor).permit(:book_id, :author_id)
    end
end
