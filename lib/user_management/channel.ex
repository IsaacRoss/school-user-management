defmodule UserManagement.Channel do
  use GenServer
  alias Phoenix.PubSub
  alias UM.{User, Repo}

  def start_link(topic) do
    GenServer.start_link(__MODULE__, topic)
  end

  def init(topic) do
    PubSub.subscribe(:school_system, topic)
    {:ok, []}
  end

  def handle_info({:name_changed, id, name}, state) do
    User
    |> Repo.get(id)
    |> User.changeset(%{first_name: name})
    |> Repo.update()

    {:noreply, state}
  end
end
