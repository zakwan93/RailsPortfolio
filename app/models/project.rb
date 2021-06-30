class Project < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                  reject_if: lambda { |attrs| attrs['name'].blank?  } 

    validates_presence_of :title, :body

    mount_uploader :thumb_image, ProjectUploader
    mount_uploader :main_image, ProjectUploader

    def self.react
      where(subtitle: 'ReactJS')
    end

    def self.position_by
      order("position ASC")
    end

    scope :ruby_on_rails_project_items, -> {where(subtitle: "Ruby on Rails")}


    extend FriendlyId
    friendly_id :title, use: :slugged
end
