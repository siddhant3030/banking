defmodule BankingWeb.BankController do
  use BankingWeb, :controller
  alias Banking.Schema.Bank
  alias Banking.Model.Bank, as: BankModel


  def index(conn, _params) do
    banks = BankModel.list_banks()
    render(conn, "index.json", banks: banks)
  end
  
  def create(conn, params) do
    banks = BankModel.create_bank(params)
    render(conn, "bank.json", banks: banks)
  end

  def update(conn, %{"id" => id, "bank" => bank_params}) do
    bank = BankModel.get_bank!(id)

    with {:ok, %Bank{} = bank} <- BankModel.update_bank(bank, Bank_params) do
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
