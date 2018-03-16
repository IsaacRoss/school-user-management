defmodule UM do
  @moduledoc """
  This is the public API that the world will talk to
  """
  alias UM.{Repo, User, Demographic, Term}
  alias Phoenix.PubSub
  import Ecto.Query

  def add_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def add_user_with_demographics(attrs \\ %{}) do
    %Demographic{}
    |> Demographic.new_user(attrs)
    |> Repo.insert()
  end

  def add_demographics(user_id, attrs \\ %{})

  def add_demographics(user_id, demos) when is_list(demos),
    do: for(x <- demos, do: add_demographics(user_id, x))

  def add_demographics(user_id, attrs) do
    get_user_by_id(user_id)
    |> Ecto.build_assoc(:demographics, attrs)
    |> Repo.insert()
  end

  def add_term(attrs \\ %{}) do
    %Term{}
    |> Term.changeset(attrs)
    |> Repo.insert()
  end

  def delete_user(user_id) do
    get_user_by_id(user_id)
    |> Repo.delete()

    PubSub.broadcast(:school_system, "users", {:user_deleted, user_id})
  end

  def get_users do
    User |> Repo.all()
  end

  def get_users_with_demographics do
    User |> Repo.all() |> Repo.preload(:demographics)
  end

  def get_users_taller_than(height),
    do:
      get_users_taller_than_query(height)
      |> Repo.all()

  defp get_users_taller_than_query(height) do
    from(
      u in User,
      join: d in Demographic,
      on: u.id == d.user_id,
      where: d.demographic == "height" and fragment("cast (? as integer)", d.value) > ^height,
      select: %{user: u, demos: d}
    )
  end

  def get_terms do
    Term |> Repo.all()
  end

  defp get_user_by_id(id) do
    Repo.get(User, id)
  end
end
