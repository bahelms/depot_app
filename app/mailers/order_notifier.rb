class OrderNotifier < ActionMailer::Base
  default from: "warehouse@pragmaticbookshelf.com"

  def received(order)
    @order = order

    mail to: order.email, subject: "Pragmatic Bookshelf Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.order_notifier.shipped.subject
  
  def shipped(order)
    @order = order

    mail to: order.email, subject: "Pragmatic Bookshelf Order Shipped"
  end
end
