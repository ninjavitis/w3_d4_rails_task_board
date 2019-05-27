class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  def self.single_board(board_id)
    Board.find_by_sql([
      "SELECT *
      FROM boards
      WHERE id = ? ;",
      board_id
  ]).first
  end

  def self.all_boards
    Board.find_by_sql(
      "SELECT *
      FROM boards;"
    )
  end

  def self.create_board(p)
    Board.find_by_sql([
      "INSERT INTO boards (name, created_at, updated_at)
      VALUES (:name, :created_at, :updated_at);",
      {
        name: p[:name],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    ])
  end

  def self.update_board(p, board_id)
    Board.find_by_sql([
      "UPDATE boards
      SET name = :name
      WHERE id = :id;",
      {
        name: p[:name],
        id: board_id
      }
    ])
  end

  def self.delete_board(board_id)
    Board.find_by_sql([
      "DELETE
      FROM boards
      WHERE id = :id ;",
      {
        id: board_id
      }
    ])
  end

end
