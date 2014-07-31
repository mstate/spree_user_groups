Spree::Variant.class_eval do
  include ActionView::Helpers

  def price_for_user(user)
    if user && user.user_group
      user.user_group.price_for_variant(self)
    else
      price
    end
  end

  def price
    if Spree::User.current.nil? or Spree::User.current.user_group.nil? then
      return prices.first.amount.to_f unless prices.first.blank? || prices.first.amount.blank?
      return product.prices.first.amount.to_f unless product.blank? || product.prices.first.blank?
      return 0
    end
  end

  #TODO-Proper fix for this hack :)
  def price_in(currency)
    Spree::Price.new.tap do |p|
      p.currency = "USD"
      p.amount = price
    end
  end
end
