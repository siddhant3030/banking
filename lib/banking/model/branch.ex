defmodule Banking.Model.Branch do
  alias Banking.Repo
  alias Banking.Schema.Branch

  def list_branches() do
    Repo.all(Branch)
  end

  def get_branch!(id), do: Repo.get!(Branch, id)

  def create_branch(attrs \\ %{}) do
    %Branch{}
    |> Branch.changeset(attrs)
    |> Repo.insert()
  end

  def update_company(%Branch{} = branch, attrs) do
    branch
    |> Branch.changeset(attrs)
    |> Repo.update()
  end

  def delete_branch(%Branch{} = branch) do
    Repo.delete(branch)
  end
end
