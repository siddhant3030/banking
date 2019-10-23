defmodule Banking.Repo.Migrations.Branch do
  use Ecto.Migration

  def change do
    create table(:branch) do
      add :branch, :string
      add :address, :string
      add :city, :string
      add :district, :string
      add :state, :string
      
      timestamps()
  end
end
