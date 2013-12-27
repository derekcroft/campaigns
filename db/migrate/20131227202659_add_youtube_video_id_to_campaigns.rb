class AddYoutubeVideoIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :youtube_video_id, :string
  end
end
