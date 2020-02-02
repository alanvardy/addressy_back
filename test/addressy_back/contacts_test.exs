defmodule AddressyBack.ContactsTest do
  use AddressyBack.DataCase

  alias AddressyBack.Contacts

  describe "people" do
    alias AddressyBack.Contacts.Person

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Contacts.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Contacts.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Contacts.create_person(@valid_attrs)
      assert person.address == "some address"
      assert person.name == "some name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Contacts.update_person(person, @update_attrs)
      assert person.address == "some updated address"
      assert person.name == "some updated name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_person(person, @invalid_attrs)
      assert person == Contacts.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Contacts.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Contacts.change_person(person)
    end
  end
end
