defmodule BankingWeb.BankView do
  use BankingWeb, :view
  alias BankingWeb.BankView

  def render("index.json", %{banks: banks}) do
    %{banks: render_many(banks, BankView, "bank.json")}
  end

  def render("show.json", %{bank: bank}) do
    %{data: render_one(bank, BankView, "bank.json")}
  end

  def render("bank.json", %{bank: bank}) do
    %{id: bank.id,
      name: bank.name}
  end
end
