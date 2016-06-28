class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customers = Customer.create!(Customer.from_csv(customer_params[:csv].path))
    redirect_to root_path
  end

  private

    def customer_params
      params.require(:customer).permit(:csv)
    end
end
