defmodule BankingWeb.BranchController do
  use BankingWeb, :controller
  alias Banking.Schema.Branch
  alias Banking.Model.Branch, as: BranchModel

  def index(conn, _params) do
    branch = BranchModel.list_branches()
    render(conn, "index.json-api", data: branch)
  end

  def create(conn, %{"branch" => branch_params}) do
    # branch_params = Map.put(branch_params, "bank_id", 22)
    with {:ok, %Branch{} = branch} <- BranchModel.create_branch(branch_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: branch)
    end
  end

  def show(conn, %{"id" => id}) do
    branch = BranchModel.get_branch!(id)
    render(conn, "show.json-api", data: branch)
  end
end
