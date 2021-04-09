defmodule Community.News.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias Community.News.Notes

  schema "contacts" do
    field :name, :map
    field :phone, :map
    field :company, :map
    field :email, :map
    field :address, :map
    has_many :notes, {"contact_notes", Notes}, foreign_key: :notes_id
    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone, :company, :email, :address])
    |> validate_required([:name, :phone, :company, :email, :address, :notes])
  end
end

defmodule Community.News.Notes do
    use Ecto.Schema

    schema "abstract table: notes" do
        field :notes_id, :integer
        field :body, :string
        timestamps()
    end
end
