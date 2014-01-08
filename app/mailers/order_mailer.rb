class OrderMailer < ActionMailer::Base
	def send_order_delivery(order)
		@order = order
		@items = order.item
		mail :to =>  @order.email, :from => "G-ShockShop", :subject => "Заказ на доставку №#{order.id}"
	end
	
	def send_order_customer(order)
		@order = order
		@items = order.item
		mail :to =>  @order.email, :from => "G-ShockShop", :subject => "Заказ на доставку №#{order.id}"
	end
end
