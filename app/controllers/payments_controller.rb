class PaymentsController < ApplicationController
   def new
    @payment = Payment.new
  end
  def create
  	
  end

  def create
    @payment = Payment.new(payment_params)
    
    if @payment.save
      flash[:success] = 'Payment successfull'
      redirect_to @payment
    else
      flash[:alert] = 'There was a problem creating  a post'
      render :new
      
    end
  end

  

  

  def show
     @payment = Payment.find(params[:id])

  end

 

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end
end
