module ApplicationHelper

  def df (price, curr='')
    number_to_currency(price, :unit => curr, :precision => 0, :delimiter => '.')
  end
end
