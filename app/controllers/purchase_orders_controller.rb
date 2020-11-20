class PurchaseOrdersController < ApplicationController
  before_action :set_product, only: [:add_product]
  before_action :generate_code, only: [:new]

  def generate_code
		self.code = SecureRandom.alphanumeric(18)
	end

  def index
    @purchase_orders = PurchaseOrder.all
  end

  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  def add_product
    @product = Product.find(params[:id])
    @purchase_order = PurchaseOrder.open.last
    @purchase_order ||= PurchaseOrder.create(status: :pending, total_amount: @product.price)
		@purchase_order.products << @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:product_id)
    end
end
