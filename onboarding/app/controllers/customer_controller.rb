class CustomerController < ApplicationController
  before_action :require_active_customer, only:[:find_all]

  def show
    @customer = Customer.find(params[:id])
  end

  def create
R   @customer = Customer.new(customer_params)
    @customer.save
    redirect_to @customer
  end

  def find_all
  R  @customers = Customer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  private def active_customer
    #check if customer is activo
    @customer = Customer.find(params[:id])
	  unless  @customer.active?
      flash[:error] = "Customer must be active"
      redirect_to @customer
    end
  end

  def customer_params
    params.required(:customer).permit(:name, :document, :active)
  end
end
