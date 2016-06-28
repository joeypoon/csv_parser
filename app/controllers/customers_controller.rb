class CustomersController < ApplicationController

  def index
    order = params[:order] || :updated_at
    sort = params[:sort] || :desc
    @customers = Customer.all.order(order => sort).page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customers = Customer.create!(Customer.from_csv(customer_params[:csv].path))
    redirect_to root_path, notice: "Upload success!"
  rescue ActiveRecord::RecordInvalid
    @customer = Customer.new
    flash[:alert] = "All CSV file entries must have fname, lname, address, city, state, and zip"
    render :new
  end

  private

    def customer_params
      params.require(:customer).permit(:csv)
    end
end
