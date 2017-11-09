defmodule MakingPaper.Invoice do
  def list(customer_id) do
    {:ok, upcoming} = Stripe.Invoice.upcoming(%{customer: customer_id})
    {:ok, full_list} = Stripe.Invoice.list(%{customer: customer_id})
    {upcoming, full_list}
  end

  def add_item(customer_id, amount, currency, description, discountable=true) do
    Stripe.Request.create("invoiceitems", %{customer: customer_id, amount: amount, currency: currency, description: description, discountable: discountable},%{customer: [:create], amount: [:create], currency: [:create], description: [:create], discountable: [:create]}, [])
  end
end
