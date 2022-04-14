module AuthenticatedRequest

  LOGIN_URL = '/users/sign_in'

  def authenticated_post(url, params = {}, user = nil)
    auth_user(url, params, user)
    post "#{url}?access-token=#{@access_token}&client=#{@client}&uid=#{@uid}" , params: params
  end

  def authenticated_patch(url, params = {}, user = nil)
    auth_user(url, params, user)
    patch "#{url}?access-token=#{@access_token}&client=#{@client}&uid=#{@uid}" , params: params
  end

  def authenticated_get(url, params = {}, user = nil)
    auth_user(url, params, user)
    get "#{url}?access-token=#{@access_token}&client=#{@client}&uid=#{@uid}"
  end

  def authenticated_put(url, params = {}, user = nil)
    auth_user(url, params, user)
    put "#{url}?access-token=#{@access_token}&client=#{@client}&uid=#{@uid}" , params: params
  end

  def authenticated_delete(url, params = {}, user = nil)
    auth_user(url, params, user)
    delete "#{url}?access-token=#{@access_token}&client=#{@client}&uid=#{@uid}"
  end

  private

  def login_params
    {
      email: new_user.email,
      password: new_user.password
    }
  end

  def new_user
    @user ||= FactoryBot.create(:user)
  end

  def auth_user(url, params, user)
    if user
      custom_user_params = {
        email: user.email,
        password: user.password
      }
      post LOGIN_URL, params: custom_user_params
    else
      post LOGIN_URL, params: login_params
    end

    @access_token = response.headers['access-token']
    @client = response.headers['client']
    @uid = response.headers['uid']
  end

end