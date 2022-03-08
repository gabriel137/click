defmodule Click.ShortLinks.ShortLink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "short_links" do
    field :hit_count, :integer, default: 0
    field :key, :string
    field :url, EctoFields.URL

    timestamps()
  end

  @doc false
  def changeset(short_link, attrs) do
    short_link
    |> cast(attrs, [:key, :url, :hit_count])
    |> validate_required([:url], message: "O campo não pode estar vazio.")
    |> case do
      %{valid?: false, errors: [url: {error, _}]} = changeset when error == "is invalid" ->
        %{changeset | errors: [url: {"O URL é inválido", [type: EctoFields.URL, validation: :cast]}]}

      changeset -> changeset
    end
  end
end
