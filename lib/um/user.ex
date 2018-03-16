defmodule UM.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias UM.Demographic

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)

    has_many(:demographics, Demographic)
    timestamps()
  end

  def changeset(%__MODULE__{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
  end
end
