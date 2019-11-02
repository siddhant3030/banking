defmodule Banking.Schema.Bank do
  use Ecto.Schema
  import Ecto.Changeset
  alias Banking.Schema.Branch

  schema "banks" do
    field :name, :string
    has_many :branches, Branch

    timestamps()
  end

  def changeset(bank, attrs) do
    bank
    |> cast(attrs, [:name])
    |> validate_required([:name])
    # |> Repo.preload(:branches)
  end
end
