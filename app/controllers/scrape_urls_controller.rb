class ScrapeUrlsController < ApplicationController
  before_action :set_scrape_url, only: %i[ show edit update destroy ]

  # GET /scrape_urls or /scrape_urls.json
  def index
    @scrape_urls = ScrapeUrl.all
  end

  # GET /scrape_urls/1 or /scrape_urls/1.json
  def show
  end

  # GET /scrape_urls/new
  def new
    @scrape_url = ScrapeUrl.new
  end

  # GET /scrape_urls/1/edit
  def edit
  end

  # POST /scrape_urls or /scrape_urls.json
  def create
    @scrape_url = ScrapeUrl.new(scrape_url_params)

    respond_to do |format|
      if @scrape_url.save
        format.html { redirect_to @scrape_url, notice: "Scrape url was successfully created." }
        format.json { render :show, status: :created, location: @scrape_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scrape_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrape_urls/1 or /scrape_urls/1.json
  def update
    respond_to do |format|
      if @scrape_url.update(scrape_url_params)
        format.html { redirect_to @scrape_url, notice: "Scrape url was successfully updated." }
        format.json { render :show, status: :ok, location: @scrape_url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scrape_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrape_urls/1 or /scrape_urls/1.json
  def destroy
    @scrape_url.destroy
    respond_to do |format|
      format.html { redirect_to scrape_urls_url, notice: "Scrape url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrape_url
      @scrape_url = ScrapeUrl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scrape_url_params
      params.require(:scrape_url).permit(:url)
    end
end
