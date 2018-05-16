class Api::V1::LoginController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def login
    @user = User.where(openid: wechat_user.fetch('openid')).first_or_initialize
    unless @user.id
      @user.username = "User#{@user.id}"
      @user.save
    end
    render json: {
        userId: @user.id
      }
  end

  private

  def wechat_params
    {
      appid: ENV['appId'],
      secret: ENV['appSecret'],
      js_code: params[:code],
      grant_type: 'authorization_code'
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def random_username

  end

end
