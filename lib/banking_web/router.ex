defmodule BankingWeb.Router do
  use BankingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug JaSerializer.Deserializer
  end

  scope "/api", BankingWeb do
    pipe_through :api

    resources "/banks", BankController
    resources "/branches", BranchController
  end
end
