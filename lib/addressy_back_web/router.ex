defmodule AddressyBackWeb.Router do
  use AddressyBackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    forward "/graphiql",
            Absinthe.Plug.GraphiQL,
            schema: AddressyBackWeb.Schema,
            interface: :playground

    forward "/api", Absinthe.Plug, schema: AddressyBackWeb.Schema
  end
end
