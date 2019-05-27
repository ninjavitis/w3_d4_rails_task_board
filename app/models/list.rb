class List < ApplicationRecord
  belongs_to :board 
  has_many :tasks, dependent: :destroy

  def self.all_lists
    List.find_by_sql(
      "SELECT *
      FROM lists;"
    )
  end

  def self.get_list(list_id)
    List.find_by_sql([
      "SELECT *
      FROM lists
      WHERE id = #{list_id};"
  ]).first
  end

  def self.create_list(p, board_id)
    List.find_by_sql([
      "INSERT INTO lists (name, board_id, created_at, updated_at)
      VALUES (:name, :board_id, :created_at, :updated_at);",
      {
        name: p[:name],
        board_id: board_id,
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    ])
  end

  def self.update_list(p, list_id)
    List.find_by_sql([
      "UPDATE lists
      SET name = ? 
      WHERE id = ? ;",
      p[:name],
      list_id
    ])
  end

  def self.delete_list(list_id)
    List.find_by_sql([
      "DELETE
      FROM lists
      WHERE id = :id ;",
      {
       id: list_id
      }
    ])
  end
end

