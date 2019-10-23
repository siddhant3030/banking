defmodule Banking.Repo.Migrations.BankTable do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :name, :string

      timestamps()
    end
  end
end
