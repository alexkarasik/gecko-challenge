class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  # GET /customers
  # GET /customers.json
  def index

    if request.post? and params.include?(:object_id) and params.include?(:timestamp)
    @customer_changes = Customer.find_by(object_id: params[:object_id], object_timestamp: params[:timestamp])['object_changes']
    end

    @customers = Customer.all

  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  # def edit
  # end

  # POST /customers
  # POST /customers.json

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  # def update
  #   respond_to do |format|
  #     if @customer.update(customer_params)
  #       format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @customer }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @customer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /customers/1
  # DELETE /customers/1.json
  # def destroy
  #   @customer.destroy
  #   respond_to do |format|
  #     format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def import
    Customer.import(params[:file])
    redirect_to root_url, notice: "Customer Added Successfully"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:object_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:object_id, :object_type, :object_changes)
    end
end
