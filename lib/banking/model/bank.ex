defmodule Banking.Model.Bank do
  import Ecto.Query
  alias Banking.Repo
  alias Banking.Schema.Bank
  alias Banking.Schema.Branch

  def list_banks() do
    Repo.all(Bank)
  end

  def get_bank!(id), do: Repo.get!(Bank, id)

  # def get_bank!(id, preloads), do: Repo.get!(Bank, id) |> Repo.preload(preloads)

  def create_bank(attrs \\ %{}) do
    %Bank{}
    |> Bank.changeset(attrs)
    |> Repo.insert()
  end

  def update_bank(%Bank{} = bank, attrs) do
    bank
    |> Bank.changeset(attrs)
    |> Repo.update()
  end

  def delete_bank(%Bank{} = bank) do
    Repo.delete(bank)
  end

  # def list_branches do
  #   Bank
  #   |> Ecto.Query.preload(:branch)
  #   |> Repo.all()
  # end
end
