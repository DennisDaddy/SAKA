class DonationsController < ApplicationController
		 

  def new
    @donation = Donation.new
    
  end

  def create
     @donation = Donation.new(donation_params)
    
     if @donation.save
     
      flash[:success] = "Your donation has been saved"
       redirect_to root_path
    else
      render 'new'
        
     end
    
  end

  private

  def donation_params
    params.require(:donation).permit(:amount)
  end

   
end
