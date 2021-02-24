class RemoveFilmsEpisodeId < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :films, :episode_id
  end
end
