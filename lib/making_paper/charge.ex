defmodule MakingPaper.Charge do
  def create(customer_id, amount, currency, description \\ "") do
    Stripe.Charge.create(%{customer: customer_id, amount: amount, currency: currency, description: description})
  end

  def auth(customer_id, amount, currency, description \\ "") do
    Stripe.Charge.create(%{customer: customer_id, amount: amount, currency: currency, description: description, capture: false})
  end

  def capture(charge_id) do
    Stripe.Charge.capture(charge_id)
  end

  def refund(charge_id) do
    Stripe.Refund.create(%{charge: charge_id})
  end
end
