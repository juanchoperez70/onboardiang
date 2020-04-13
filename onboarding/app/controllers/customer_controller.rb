class CustomerController < ApplicationController
  before_action :require_active_customer

  def create
    @customer = Customer.new(params[:customer])
    @customer.save
    redirect_to @customer
  end

  def find_all
    @customers = Customer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  private

  def active_customer
    #check if customer is activo
    @customer = Customer.find(params[:id])
	  unless  @customer.active?
      flash[:error] = "Customer must be active"
    end

  end

end
