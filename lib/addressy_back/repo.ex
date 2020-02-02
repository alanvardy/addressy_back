defmodule AddressyBack.Repo do
  use Ecto.Repo,
    otp_app: :addressy_back,
    adapter: Ecto.Adapters.Postgres
end
