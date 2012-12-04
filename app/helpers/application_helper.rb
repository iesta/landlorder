module ApplicationHelper

  def df (price, curr='')
    number_to_currency(price, :unit => curr, :precision => 0, :delimiter => ',')
  end

  def sdf(price,curr='')
    df(price.gsub(/[^0-9]/i, '').to_i , curr)
  end
end
