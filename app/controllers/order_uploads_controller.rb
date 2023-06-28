require 'csv'

class OrderUploadsController < ApplicationController
  before_action :set_order_upload, only: %i[ show edit update destroy ]

  # GET /order_uploads or /order_uploads.json
  def index
    @order_uploads = OrderUpload.all
  end

  # GET /order_uploads/1 or /order_uploads/1.json
  def show
  end

  # GET /order_uploads/new
  def new
    @order_upload = OrderUpload.new
  end

  # GET /order_uploads/1/edit
  def edit
  end

  # POST /order_uploads or /order_uploads.json
  def create
    @order_upload = OrderUpload.new(order_upload_params)

    respond_to do |format|
      if @order_upload.save
        create_records_from_file(@order_upload.csv_file)
        format.html { redirect_to order_upload_url(@order_upload), notice: "Order upload was successfully created. Total: $#{@total}" }
        format.json { render :show, status: :created, location: @order_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_uploads/1 or /order_uploads/1.json
  def update
    respond_to do |format|
      if @order_upload.update(order_upload_params)
        format.html { redirect_to order_upload_url(@order_upload), notice: "Order upload was successfully updated." }
        format.json { render :show, status: :ok, location: @order_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_uploads/1 or /order_uploads/1.json
  def destroy
    @order_upload.destroy

    respond_to do |format|
      format.html { redirect_to order_uploads_url, notice: "Order upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_upload
      @order_upload = OrderUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_upload_params
      params.require(:order_upload).permit(:csv_file)
    end

    def create_records_from_file(file)
      # After upload, displays the total amount gross revenue represented by the uploaded file.
      @total = 0.0
      CSV.parse(file.download, headers: true, col_sep: "\t") do |row|
        OrderSummary.new(
          customer_name: row["purchaser name"],
          description: row["item description"],
          price: row["item price"].to_f,
          item_count: row["purchase count"].to_i,
          merchant_address: row["merchant address"],
          merchant_name: "merchant name").save!

        # row_total = row["item price"].to_f * row["purchase count"].to_i
        # @total += row_total
      end
      @total = OrderSummary.sum("price * item_count")
    end
end
