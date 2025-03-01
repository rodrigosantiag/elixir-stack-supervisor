defmodule Stack do
  @moduledoc """
  A stack is a data structure that follows the Last In First Out (LIFO) principle.
  """

  use GenServer

  @doc """
  Starts the stack process.
  """
  @spec start_link(opts :: Keyword.t()) :: {:ok, pid()} | {:error, term()}
  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_state = [element | state]
    {:reply, new_state, new_state}
  end
end
