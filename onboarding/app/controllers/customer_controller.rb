class CustomerController < ApplicationController
  before_action :require_active_customer, only:[:show]
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
   @customer = Customer.new(customer_params)
   @customer.save
    redirect_to @customer
  end

  def find_all
    #byebug
    @customers = Customer.all
    respond_to do |format|
      format.html { redirect_to 'customers_path' }
      format.json { render json: @customers }
    end
  end

  private def require_active_customer
    #check if customer is activo
    @customer = Customer.find(params[:id])
	  unless  @customer.active?
      flash[:error] = "Customer must be active"
      redirect_to @customer
    end
  end

  private def customer_params
    params.required(:customer).permit(:name, :document, :active)
  end
end
