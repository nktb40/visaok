# encoding: utf-8
class QuestionMailer < ActionMailer::Base
	def send_question(question, email)
		@question = question
		mail :to =>  email, :from => "help@vizaok.ru", :subject => "Вопрос от #{question.email}"
	end
end
