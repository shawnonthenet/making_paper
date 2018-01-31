defmodule MakingPaper.Subscription do
  alias MakingPaper.Customer

  def add(customer_id, plan_id) do
    Stripe.Subscription.create(%{customer: customer_id, plan: plan_id})
  end

  def add(customer_id, plan_id, ""), do: add(customer_id, plan_id)
  def add(customer_id, plan_id, nil), do: add(customer_id, plan_id)
  def add(customer_id, plan_id, coupon_id) do
    Stripe.Subscription.create(%{customer: customer_id, plan: plan_id, coupon: coupon_id})
  end

  def change(subscription_id, new_plan_id) do
    Stripe.Subscription.update(subscription_id, %{plan: new_plan_id})
  end

  def list(customer_id) do
    {:ok, cust} = Customer.get(customer_id)
    Customer.subscriptions
  end

  def delete(customer_id, plan_id) do
    {:ok, cust} = Customer.get(customer_id)
    Enum.map(cust.subscriptions.data, fn(s) ->
      if s.plan.id == plan_id do
        Stripe.Subscription.delete(s.id)
      end
    end)
  end
end
