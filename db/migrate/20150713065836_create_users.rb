class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name       # ユーザー名
      t.string :full_name  # 本名
      t.string :email      # メールアドレス
      t.date :birthday     # 生年月日
      t.boolean :admin, null: false, default: false  # 管理者フラグ
      t.timestamps null: false
    end
  end
end
