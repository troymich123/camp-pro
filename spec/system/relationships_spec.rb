require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "ユーザーフォロー機能", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end
  
  context 'ログインしたユーザーはフォロー、フォロー解除できる' do
    @rank_a = FactoryBot.create(:rank1)
    @rank_b = FactoryBot.create(:rank2)
    it 'ユーザーをフォロー、フォロー解除できる' do
      basic_pass root_path
      sign_in(@user1)
      visit user_path(@user2)
      click_link 'フォローする'
      expect(page).to have_link 'フォローを外す'
      expect(@user2.followed.count).to eq(1)
      expect(@user1.follower.count).to eq(1)

      click_link 'フォローを外す'
      expect(page).to have_link 'フォローする'
      expect(@user2.followed.count).to eq(0)
      expect(@user1.follower.count).to eq(0)
    end
  end
end