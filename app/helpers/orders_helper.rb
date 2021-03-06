module OrdersHelper

  def set_user_cookie
    cookies[:gshock_cart_items] = {
        :value => [].to_json,
        :expires => 24.hours.from_now
    }
  end

  def user_cookie_values
    load_user_cookie_data
  end

  def user_cookie_exists?
        cookies[:gshock_cart_items].present?
  end

  def add_to_user_cookie(value)
    current = load_user_cookie_data
    if current.any?{|c| c["id"]==value}	
      @c = current.detect{|c| c.detect{|k,v| k=="id"&&v==value}}
    	@c["quantity"] = @c["quantity"] +1
    else
    current << {
    	:id => value,
    	:quantity => 1
    }
    end
    
    cookies[:gshock_cart_items] = current.to_json
  end

  def remove_from_user_cookie(value)
    current = load_user_cookie_data
    current.delete(value)
    cookies[:gshock_cart_items] = current.to_json
  end
  
  def delete_cookie
    cookies.delete :gshock_cart_items
  end

  private

  def load_user_cookie_data
    JSON.load(cookies[:gshock_cart_items])
  end

end