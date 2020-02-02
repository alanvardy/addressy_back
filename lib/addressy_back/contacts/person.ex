defmodule AddressyBack.Contacts.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :address, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
