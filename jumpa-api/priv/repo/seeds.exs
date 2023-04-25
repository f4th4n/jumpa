# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Jumpa.Repo.insert!(%Jumpa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

room1 = Jumpa.Repo.get(JumpaApi.Game.Room, 1)

new_room = %JumpaApi.Game.Room{
  id: 1,
  region: "sea",
  token: "abc"
}

case room1 do
  nil -> Jumpa.Repo.insert!(new_room)
  _ -> nil
end

player1 = Jumpa.Repo.get(JumpaApi.Game.Player, 1)

new_player = %JumpaApi.Game.Player{
  id: 1,
  nick: "player1",
  pos_x: 1.0,
  pos_y: 2.0,
  token: "abc",
  room_id: 1
}

case player1 do
  nil -> Jumpa.Repo.insert!(new_player)
  _ -> nil
end

player2 = Jumpa.Repo.get(JumpaApi.Game.Player, 1)

new_player = %JumpaApi.Game.Player{
  id: 1,
  nick: "player2",
  pos_x: 1.0,
  pos_y: 2.0,
  token: "def",
  room_id: 1
}

case player2 do
  nil -> Jumpa.Repo.insert!(new_player)
  _ -> nil
end
