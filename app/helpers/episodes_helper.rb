module EpisodesHelper

  def delete_entry episode, entry
    link_to "Delete This Entry", episode_entry_path(episode, entry), confirm: 'Are you sure? Deleting an entry is permanent.', method: :delete
  end

  def edit_entry episode, entry
    link_to "Edit This Entry", edit_episode_entry_path(@episode, entry)
  end

end
