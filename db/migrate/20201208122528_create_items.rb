class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
    end
  end
end
# ユーザー管理、商品出品機能でrollbackしてカラム追加！