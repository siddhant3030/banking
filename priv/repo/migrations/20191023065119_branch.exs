defmodule Banking.Repo.Migrations.Branch do
  use Ecto.Migration

  def change do
    create table(:branches, primary_key: false) do
      add :ifsc, :string, primary_key: true
      add :branch, :string
      add :address, :string
      add :city, :string
      add :district, :string
      add :state, :string
      add :bank_id, references(:banks)

      timestamps()
    end
  end
end
