# encoding: utf-8
class OrderMailer < ActionMailer::Base
	def send_order_delivery(order)
		@order = order
		email = "nktb40@gmail.com"
		mail :to =>  email, :from => "VISAOK", :subject => "Заявка visaOK №#{order.id}"
	end
	
	def send_order_customer(order)
		@order = order
		mail :to =>  @order.email, :from => "VISAOK", :subject => "Заявка visaOK №#{order.id}"
	end
end
