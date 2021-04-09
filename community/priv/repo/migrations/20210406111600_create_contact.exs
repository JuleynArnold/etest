defmodule Community.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
        add :name, :map
        add :phone, :map
        add :company, :map
        add :email, :map
        add :address, :map

      timestamps()
    end

  end
end
