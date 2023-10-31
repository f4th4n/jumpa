defmodule GenGameApp.GameProducer do
  use GenServer

  @client_id :game_producer
  @hosts [kafka: 9092]
  @topic "gg.game"

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def init(init_arg) do
    {:ok, _pid} = :brod.start_link_client(@hosts, @client_id, _client_config = [])

    :brod.start_producer(@client_id, @topic, _producer_config = [])

    {:ok, init_arg}
  end

  def send_msg(partition, key_msg, msg) do
    :brod.produce_sync(@client_id, @topic, partition, key_msg, msg)
  end
end
