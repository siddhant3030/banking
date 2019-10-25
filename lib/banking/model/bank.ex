defmodule Banking.Model.Bank do
  alias Banking.Repo
  alias Banking.Schema.Bank

  def list_banks() do
    Repo.all(Bank)
  end

  def get_bank!(id), do: Repo.get!(Bank, id)

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
end
