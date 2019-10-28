defmodule BankingWeb.BankView do
  use BankingWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name]
end
