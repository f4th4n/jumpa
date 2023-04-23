defmodule JumpaWorld.GameSpv do
  @moduledoc """
  Game supervisor
  """

  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    children = [
      %{
        id: JumpaWorld.Game,
        start: {JumpaWorld.Game, :start_link, [5]}
      }
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end