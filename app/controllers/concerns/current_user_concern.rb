module CurrentUserConcern 
    extend ActiveSupport::Concern

    included do
        before_action :current_user
    end

    def current_user
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guset"
        guest.last_name = "User"
        guest.email = "guest@examle.com"
        guest
    end

end

