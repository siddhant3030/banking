defmodule Banking.Schema.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banks" do
    field :name, :string

    timestamps()
  end

  def changeset(bank, attrs) do
    bank
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
