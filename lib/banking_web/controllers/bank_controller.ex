defmodule BankingWeb.BankController do
  use BankingWeb, :controller
  alias Banking.Schema.Bank
  alias Banking.Model.Bank, as: BankModel



  def index(conn, _params) do
    banks = BankModel.list_banks()
    render(conn, "index.json", banks: banks)
  end

  def create(conn, %{"bank" => bank_params}) do
    with {:ok, %Bank{} = bank} <- BankModel.create_bank(bank_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", project_path(conn, :show, bank))
      |> render("show.json", bank: bank)
    end

  end

  def show(conn, %{"id" => id}) do
    bank = BankModel.get_bank!(id)
    render(conn, "show.json", bank: bank)
  end

  def update(conn, %{"id" => id, "bank" => bank_params}) do
    bank = BankModel.get_bank!(id)

    with {:ok, %Bank{} = bank} <- BankModel.update_bank(bank, bank_params) do
      render(conn, "show.json", bank: bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    bank = BankModel.get_bank!(id)

    with {:ok, %Bank{}} <- BankModel.delete_bank(bank) do
      send_resp(conn, :no_content, "")
    end
  end
end
