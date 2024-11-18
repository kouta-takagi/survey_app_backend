class AddReferencesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :surveys, :user
    add_reference :questions, :user
    add_reference :answers, :user
  end
end
