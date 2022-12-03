class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|

      # 会員IDを保存するカラム
      t.integer :member_id, null: false
      # 目標を保存するカラム
      t.string :goal, null: false
      # 理由を保存するカラム
      t.text :reason, null: false
      # 締め切りを保存するカラム
      t.date :deadline, null: false
      # 完了状況を保存するカラム
      t.boolean :completion_status, null: false, default: false

      t.timestamps null: false
    end
  end
end
