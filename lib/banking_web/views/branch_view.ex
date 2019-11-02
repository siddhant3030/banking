defmodule BankingWeb.BranchView do
  use BankingWeb, :view
  use JaSerializer.PhoenixView

  attributes [:branch, :address, :city, :district, :state, :ifsc]
end
