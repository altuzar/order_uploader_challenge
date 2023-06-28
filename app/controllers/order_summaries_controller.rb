class OrderSummariesController < ApplicationController
  before_action :set_order_summary, only: %i[ show edit update destroy ]

  # GET /order_summaries or /order_summaries.json
  def index
    @order_summaries = OrderSummary.all
  end

  # GET /order_summaries/1 or /order_summaries/1.json
  def show
  end

  # GET /order_summaries/new
  def new
    @order_summary = OrderSummary.new
  end

  # GET /order_summaries/1/edit
  def edit
  end

  # POST /order_summaries or /order_summaries.json
  def create
    @order_summary = OrderSummary.new(order_summary_params)

    respond_to do |format|
      if @order_summary.save
        format.html { redirect_to order_summary_url(@order_summary), notice: "Order summary was successfully created." }
        format.json { render :show, status: :created, location: @order_summary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_summaries/1 or /order_summaries/1.json
  def update
    respond_to do |format|
      if @order_summary.update(order_summary_params)
        format.html { redirect_to order_summary_url(@order_summary), notice: "Order summary was successfully updated." }
        format.json { render :show, status: :ok, location: @order_summary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_summaries/1 or /order_summaries/1.json
  def destroy
    @order_summary.destroy

    respond_to do |format|
      format.html { redirect_to order_summaries_url, notice: "Order summary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_summary
      @order_summary = OrderSummary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_summary_params
      params.require(:order_summary).permit(:customer_name, :description, :price, :item_count, :merchant_address, :merchant_name)
    end
end
