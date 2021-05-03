class Project < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.react
      where(subtitle: 'ReactJS')
    end

    scope :ruby_on_rails_project_items, -> {where(subtitle: "Ruby on Rails")}
end
