defmodule Banking.Schema.Branch do
  use Ecto.Schema
  import Ecto.Changeset

  schema "branches" do
    field :branch, :string
    field :address, :string
    field :city, :string
    field :district, :string
    field :state, :string

    timestamps()
  end

  def changeset(branch, attrs) do
    branch
    |> cast(attrs, [:branch, :address, :city, :district, :state])
    |> validate_required([:branch, :address, :city, :district, :state])
  end
end
