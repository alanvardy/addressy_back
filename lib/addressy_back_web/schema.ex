defmodule AddressyBackWeb.Schema do
  use Absinthe.Schema
  alias AddressyBack.Contacts

  query do
    field :person, :person do
      arg(:id, non_null(:id))

      resolve(fn %{id: id}, _ ->
        Contacts.get_person(id)
      end)
    end

    field(:people, list_of(:person)) do
      resolve(fn _, _ ->
        {:ok, Contacts.list_people()}
      end)
    end
  end

  @desc "A real live person"
  object :person do
    field :id, :id
    field :name, :string
    field :address, :string
  end
end
