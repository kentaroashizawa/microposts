class LikesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'Miropostをファボしました'
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'Miropostをファボをやめました'
    redirect_back(fallback_location: root_url)
  end
end

# user = User.find(params[:follow_id]) → Micropostのレコードを確定したい
# current_user.follow(user) → loke unlike を使いたい
# flash[:success] = 'ユーザをフォローしました。' →　適当に書き換え
# redirect_to user →　redirect_back(fallback_location: root_url)

# params[:follow_id]は意図的に `follow_id` というパラメーターを送るようにviewに仕込みをしています。
# つまり、Viewは 例えば、params[:micropost_id] などのようにMicropostのパラメーターを送る事が出来ればOK！

# ここのコントローラーでは、そのparams[:micropost_id]を受けて like unlike 出来るとOK！