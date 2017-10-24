class Order < ApplicationRecord
	belongs_to :violation
  def purchase
     response = EXPRESS_GATEWAY.purchase(@violation.amount, express_purchase_options)
     response.success?
  end
   def express_token=(token)
      self[:express_token]=token
      if new_record? && !token.blank?
        details = EXPRESS_GATEWAY.details_for(token)
        self.express_payer_id = details.payer_id
       end
    end 
  private 
    def express_purchase_options {
      :ip = ip, 
      :express_payer_id => express_payer_id,
      :violation_id => violation_id
    }
   end
end
