class Api::V1::LoginController < Api::V1::BaseController
  URL = "https://api.weixin.qql.com/sns/jscode2session".freeze

  def login
    p params
    @user = User.find_or_create_by(open_id: wechat_user.fetch('openid'))
  
  render json: {
    userId: @user.id
  }
  end

  private

  def wechat_params
    {
      appId: ENV['appId'],
      appSecret: ENV['appSecret'],
      js_code: params[:code],
      grant_type: 'authorization_code'
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
    p @wechat_response
    p @wechat_user
  end
end
