defmodule CommunityWeb.ContactResolver do
  alias Community.Contact

  def get_contact(_root, args, _info) do
        case Map.fetch(args, :id) do
            {:ok, id} ->
                {:ok, Contact.get_contact(id)}
            _error ->
                {:error, "Failed to parse Id"}
        end
  end

  def create_contact(_root, args, _info) do
      case Contact.create_contact(args) do
        {:ok, contact} ->
          {:ok, contact}
        _error ->
          {:error, "could not create contact"}
      end
  end
end
