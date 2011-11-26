class OrderMailer < ActionMailer::Base
  default from: "criartconcept@gmail.com"

  def order_confirmation(user,order)
    @user = user
    @order = order
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Encomenda #{order.id} confirmada")
  end
end
