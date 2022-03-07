defmodule Click.Repo do
  use Ecto.Repo,
    otp_app: :click,
    adapter: Ecto.Adapters.SQLite3
end
