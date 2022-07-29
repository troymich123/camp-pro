class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    # 経験値アップ・レベルアップ機能
    followeduser = User.find(params[:user_id])
    followeduser.exp_point = followeduser.exp_point + 1
    followeduser.update(exp_point: followeduser.exp_point)
    if followeduser.rank < 26
      ranksetting = RankSetting.find_by(rank: followeduser.rank + 1)
      if ranksetting.threshold <= followeduser.exp_point
        followeduser.rank = followeduser.rank + 1
        followeduser.rank_name = ranksetting.rank_name
        followeduser.update(rank: followeduser.rank, rank_name: followeduser.rank_name)
      end
    end
    # /経験値アップ・レベルアップ機能
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    # 経験値ダウン・レベルダウン機能
    followeduser = User.find(params[:user_id])
    followeduser.exp_point = followeduser.exp_point - 1
    followeduser.update(exp_point: followeduser.exp_point)
    if followeduser.rank > 1
      ranksetting = RankSetting.find_by(rank: followeduser.rank - 1)
      if ranksetting.threshold <= followeduser.exp_point
        followeduser.rank = followeduser.rank - 1
        followeduser.rank_name = ranksetting.rank_name
        followeduser.update(rank: followeduser.rank, rank_name: followeduser.rank_name)
      end
    end
    # /経験値ダウン・レベルダウン機能
    redirect_to request.referer
  end
end
