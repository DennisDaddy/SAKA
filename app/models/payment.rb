class Payment < ApplicationRecord
	require “rubygems”
require “active_merchant”

ActiveMerchant::Billing::Base.mode=:test

gateway=ActiveMerchant::Billing::PaypalGateway.new(
:login=> “API username”,
:password=>”API Password”,
:signature=>”signature”
)
# here the credit card information of the personal test account

credit_card=ActiveMerchant::Billing::CreditCard.new(
:type=>”visa”,
:number=>”4582849457729927″,
:verification_value=>”000″,
:month=>01,
:year=>2013,
:first_name=>”John”,
:last_name=>”M V”
)
if credit_card.valid?
response=gateway.purchase(1000,credit_card,:ip=> “127.0.0.0”, :billing_address=> {:name=>”john M.V”,:address1=>”Muttath”,:city=>”Thrissur”,:state=>”Kerala”,:country=>”IN”,:ZIP=>”680505″})
if response.success?
puts “purchase complete!”
else
puts “Error: #{response.message}”
end
else
puts “Error:credit card is not valid”
end
end
