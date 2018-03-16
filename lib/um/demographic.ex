defmodule UM.Demographic do
  use Ecto.Schema
  import Ecto.Changeset
  alias UM.User

  schema "demographics" do
    field(:demographic, :string)
    field(:value, :string)
    belongs_to(:user, User)

    timestamps()
  end

  def new_user(%__MODULE__{} = demographics, attrs \\ %{}) do
    demographics
    |> cast(attrs, [:demographic, :value])
    |> cast_assoc(:user, required: true)
  end
end
