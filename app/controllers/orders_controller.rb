class OrdersController < ApplicationController
	 def expreess_checkout
        @violation = Violation.find([params[:violation_id])
        @amount = @violation.amount.to_i
        response = EXPRESS_GATEWAY.setup_purchase(@amount,
                                                  ip: request.remote_ip,
                                                  return_url: violations_url,
                                                  currency: "USD",
                                                  allow_guest_checkout: true,
                                                  items: [{notice_no: "Donate",
                                                           description: "Paying to" +
                                                           @violation.notice_no,
                                                           quantity: "1",
                                                           amount: @amount}]
                    )
        redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
     end
        
     def new
        @order = Order.new(:express_token => params[:token])
        @violation = Violation.find(params[:violation_id])
     end
 
     def create
        @order = Order.new(order_params)
        @order.ip = request.remote_ip
          if @order.save
            @violations = Violation.find(params[:order][:violation_id])
            @violations.update_attributes(:amount => @amt)
            flash[:notice] = "Payment Done Successfully"
            redirect_to violation_url(@violation)
           else
            flash[:notice] = "Succesfull"
            rednder :action => 'new'
           end
end
