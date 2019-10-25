defmodule BankingWeb.BankView do
  use BankingWeb, :view
  alias BankingWeb.BankView

  def render("index.json", %{banks: banks}) do
    %{banks: render_many(banks, BankView, "bank.json")}
  end

 


end
