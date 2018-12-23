defmodule MakingPaper.Charge do
  def create(customer_id, amount, currency, description \\ "") do
    Stripe.Charge.create(%{customer: customer_id, amount: amount, currency: currency, description: description})
  end
end
