class Task < ApplicationRecord
  belongs_to :list

  def self.get_task(task_id)
    Task.find_by_sql([
      "SELECT *
      FROM tasks
      WHERE id = :id;",
      {
        id: task_id
      }
    ]).first
  end

  def self.all_tasks(list_id)
    Task.find_by_sql([
      "SELECT *
      FROM tasks
      WHERE list_id = :id
      ORDER BY due;",
      { 
        id: list_id
      }
    ])
  end

  def self.create_task(p, list_id)
    Task.find_by_sql([
      "INSERT INTO tasks (name, description, due, tags, status, created_at, updated_at, list_id)
      VALUES (:name, :description, :due, :tags, :status, :created_at, :updated_at, :list_id);",
      {
        name: p[:name],
        description: p[:description],
        due: p[:due],
        tags: p[:tags] ? p[:tags] : "",
        status: "Unstarted",
        created_at: DateTime.now, 
        updated_at: DateTime.now,
        list_id: list_id
      }
    ])
  end

  def self.delete_task(task_id)
    Task.find_by_sql([
      "DELETE
      FROM tasks
      WHERE id = :id;",
      {
        id: task_id
      }
    ])
  end
end
