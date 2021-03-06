class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  #before_action :authenticate_user!

  protect_from_forgery except: [:api_create]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("updated_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        @products.map do |p|
          p.image = "1" if not p.image.nil?
          p.url = product_url(p)
        end
        # @products.map { |p| p.image = "1" if p.image != nil }
        render :json => @products, methods: [:url]
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    begin
      set_product
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid product #{params[:id]}"
      redirect_to products_path, :notice => 'Invalid product'
    end
  end



  def create
    render json: params
  end


  def api_create
    if not params[:product].nil?
      if not params[:product][:name].nil? and not params[:product][:price].nil?
        @product = Product.create!(params.permit![:product])
        render json: @product
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :description, :image_url)
  end


end
