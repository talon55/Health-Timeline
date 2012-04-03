class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :notes, type: String
  # include other fields for movies, pictures, or audio files

  embedded_in :episode
end
