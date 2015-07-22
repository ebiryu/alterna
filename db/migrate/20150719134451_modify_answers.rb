class ModifyAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :yesno, :boolean
  end
end
