class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all

  end

  def result
    redirect_to searches_path if params[:keyword] == ""
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)#selectメソッドで配列から何も入っていない要素を削除.これを記述しないと先頭に空白を入れて検索したとき全てのレコードにヒットしてしまう。
    @search = Search
    keywords.each do |keyword|
      @descriptions = @search.where('description LIKE(?) OR axess LIKE(?) OR amadeus LIKE(?) OR infini LIKE(?)',"%#{params[:keyword]}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
      respond_to do |format|
        format.html
        format.json
    end 

    end
  end


  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    if @search.save 
      redirect_to searches_path
    else
      render :new
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:amadeus, :description, :axess, :infini)
    end
end
