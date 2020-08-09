class AddEmailNotificationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notify_when_comment_created, :boolean
    add_column :users, :notify_when_subscription_added, :boolean
    add_column :users, :notify_when_photo_added, :boolean
  end
end
