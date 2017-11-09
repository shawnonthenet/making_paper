defmodule MakingPaper.Invoice do
  def list(customer_id) do
    upcoming = case Stripe.Invoice.upcoming(%{customer: customer_id}) do
      {:ok, upcoming} ->
        upcoming
      _ ->
        []
    end
    {:ok, full_list} = Stripe.Invoice.list(%{customer: customer_id})
    {upcoming, full_list}
  end

  def get(customer_id, invoice_id) do
    case Stripe.Invoice.retrieve(invoice_id) do
      {:ok, invoice} ->
        if invoice.customer == customer_id do
          {:ok, invoice}
        else
          {:error, :not_found}
        end
      error ->
        error
    end
  end

  def add_item(customer_id, amount, currency, description, discountable=true) do
    Stripe.Request.create("invoiceitems", %{customer: customer_id, amount: amount, currency: currency, description: description, discountable: discountable},%{customer: [:create], amount: [:create], currency: [:create], description: [:create], discountable: [:create]}, [])
  end
end
