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
    
    def flash_class(key)
        case key
        when 'notice' then 'alert alert-info'
        when 'success' then 'alert alert-success'
        when 'error' then 'alert alert-danger'
        when 'alert' then 'alert alert-warning'
        end 
    end
end
