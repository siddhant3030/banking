defmodule Banking.Schema.Branch do
  use Ecto.Schema
  import Ecto.Changeset
  alias Banking.Schema.Bank

  @primary_key {:ifsc, :string, []}

  schema "branches" do
    field :branch, :string
    field :address, :string
    field :city, :string
    field :district, :string
    field :state, :string
    belongs_to :bank, Bank

    timestamps()
  end

  def changeset(branch, attrs) do
    branch
    |> cast(attrs, [:ifsc, :branch, :address, :city, :district, :state])
    |> validate_required([:ifsc, :branch, :address, :city, :district, :state])
  end
end
