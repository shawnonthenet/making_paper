defmodule MakingPaper.Card do
  def add(customer_id, token) do
    Stripe.Card.create(%{customer: customer_id, source: token})
  end

  def delete(card_id) do
    Stripe.Card.delete(card_id, %{})
  end

  def replace(customer_id, old_card_id, token) do
    delete(old_card_id)
    add(customer_id, token)
  end

  def set_primary(customer_id, card_id) do
    Stripe.Customer.update(customer_id, %{default_source: card_id})
  end

  def list(customer_id) do
    {:ok, res} = Stripe.Card.list(%{customer: customer_id})
    res
  end
end
