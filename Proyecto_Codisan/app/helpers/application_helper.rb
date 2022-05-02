module ApplicationHelper

    def user_avatar(user, size=40)
        if user.avatar.attached?
            user.avatar.variant(resize_to_fill: [40, nil])
        end
    end 

    def user_avatar2(user, size=40)
        if user.avatar.attached?
            user.avatar.variant(resize_to_fill: [100, nil])
        end
    end 
end
