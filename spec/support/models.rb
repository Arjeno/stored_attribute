class Post < ActiveRecord::Base
  store :data, :accessors => [:show_date, :show_author, :background_color]

  attribute :show_date,         :type => :boolean,  :default => false
  attribute :show_author,       :type => :boolean,  :default => true
  attribute :background_color,  :type => :string,   :default => '#FFFFFF'
end
