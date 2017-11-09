defmodule MakingPaper.Card do
  def add(customer_id, token) do
    Stripe.Card.create(:customer, customer_id, token)
  end

  def delete(customer_id, card_id) do
    Stripe.Card.delete(:customer, customer_id, card_id)
  end

  def replace(customer_id, old_card_id, token) do
    delete(customer_id, old_card_id)
    add(customer_id, token)
  end

  def list(customer_id) do
    Stripe.Card.list(:customer, customer_id)
  end
end
