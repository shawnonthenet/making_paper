defmodule MakingPaper.Customer do
  def create(email) do
    Stripe.Customer.create(%{email: email})
  end

  def get(customer_id) do
    Stripe.Customer.retrieve(customer_id)
  end

  def delete(customer_id) do
    Stripe.Customer.delete(customer_id)
  end
end
