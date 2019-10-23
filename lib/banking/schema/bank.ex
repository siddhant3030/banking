defmodule Banking.Schema.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banks" do
    field :name, :string

    timestamps()
  end
end
