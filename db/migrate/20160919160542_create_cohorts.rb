class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|

      t.timestamps
    end
  end
end
