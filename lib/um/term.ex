defmodule UM.Term do
  use Ecto.Schema
  import Ecto.Changeset

  schema "terms" do
    field(:name, :string)
    field(:start_date, :naive_datetime)
    field(:end_date, :naive_datetime)

    timestamps()
  end

  def changeset(%__MODULE__{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :start_date, :end_date])
    |> validate_required([:name, :start_date, :end_date])
  end
end
