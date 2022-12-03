class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|

      # 会員IDを保存するカラム
      t.integer :member_id, null: false
      # 目標IDを保存するカラム
      t.integer :target_id, null: false
      # 内容を保存するカラム
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
