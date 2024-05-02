class RecipesController < ApplicationController
  require 'open-uri'
  before_action :fetch_info, only: :fetch_info

  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def fetch_info
    url = params[:url]
    doc = Nokogiri::HTML(URI.open(url))
    title = doc.at_css('title').text.strip
    image_url = doc.at_css('meta[property="og:image"]')&.[]('content') || doc.at_css('meta[name="twitter:image"]')&.[]('content')
    description = doc.at_css('meta[property="og:description"]')&.[]('content') || doc.at_css('meta[name="twitter:description"]')&.[]('content')

    render json: { success: true, title: title, image_url: image_url, description: description_url }
  rescue StandardError => e
    render json: { success: false, error: "Unable to fetch information from URL: #{e.message}" }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:original_url, :title, :image_url, :description_url)
  end

end
