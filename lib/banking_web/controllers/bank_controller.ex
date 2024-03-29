defmodule BankingWeb.BankController do
  use BankingWeb, :controller
  alias Banking.Schema.Bank
  alias Banking.Model.Bank, as: BankModel

  def index(conn, _params) do
    banks = BankModel.list_banks()
    render(conn, "index.json-api", data: banks)
  end

  def create(conn, %{"bank" => bank_params}) do
    require IEx; IEx.pry
     with {:ok, %Bank{} = bank} <- BankModel.create_bank(bank_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: bank)
    end
  end

  def show(conn, %{"id" => id}) do
    bank = BankModel.get_bank!(id)
    render(conn, "show.json-api", data: bank)
  end

  def update(conn, %{"id" => id, "bank" => bank_params}) do
    bank = BankModel.get_bank!(id)

    with {:ok, %Bank{} = bank} <- BankModel.update_bank(bank, bank_params) do
      render(conn, "show.json-api", data: bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    bank = BankModel.get_bank!(id)

    with {:ok, %Bank{}} <- BankModel.delete_bank(bank) do
      send_resp(conn, :no_content, "")
    end
  end
end



