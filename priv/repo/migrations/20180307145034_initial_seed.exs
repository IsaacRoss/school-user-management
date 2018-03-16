defmodule UM.Repo.Migrations.InitialSeed do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:email, :string)

      timestamps()
    end

    create table(:demographics) do
      add(:user_id, references(:users, on_delete: :delete_all))
      add(:demographic, :string)
      add(:value, :string)

      timestamps()
    end

    create table(:terms) do
      add(:name, :string)
      add(:start_date, :naive_datetime)
      add(:end_date, :naive_datetime)

      timestamps()
    end

    create(index("demographics", [:user_id, :demographic]))
    create(index("terms", [:start_date, :end_date]))
  end
end
