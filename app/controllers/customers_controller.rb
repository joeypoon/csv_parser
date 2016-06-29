class CustomersController < ApplicationController

  def index
    session[:order] = params[:order] || session[:order] || :updated_at
    session[:sort] = params[:sort] || session[:sort] || :desc
    session[:search] = params[:search] || session[:search]
    if session[:search].present?
      @customers = Customer.search(session[:search])
                           .order(session[:order] => session[:sort])
                           .page(params[:page])
    else
      @customers = Customer.all
                           .order(session[:order] => session[:sort])
                           .page(params[:page])
    end
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
