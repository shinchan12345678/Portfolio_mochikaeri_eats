class Public::CustomersController < Public::ApplicationController
  def show
    @owners = current_customer.owners
    @items = current_customer.items
  end
  
  def update 
    current_customer.update(custemer_params)
    redirect_to custemer_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:nickname, :email)
  end
end
