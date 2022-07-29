require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

# RSpec.describe "ユーザーフォロー機能", type: :system do
#   before do
#     @user1 = FactoryBot.create(:user)
#     @user2 = FactoryBot.create(:user)
#     FactoryBot.create(:rank_setting)
#   end

#   context 'ユーザーをフォローできるとき' do
#     it 'ログインしたユーザーは他のユーザーをフォローすることができる' do
#       basic_pass root_path
#       sign_in(@user1)
#       visit user_path(@user2)
#       expect(page).to have_link 'フォローする'
#       expect{
#         click_link 'フォローする'
#       }.to change { Relationship.count }.by(1)
#       expect(current_path).to eq(user_path(@user2))
#       expect(page).to have_link 'フォローを外す'
#     end
#   end

#   context 'ユーザーをフォローできないとき' do
#     it 'ログインしているユーザーは自分自身をフォローすることができない' do
#       visit root_path
#       sign_in(@user1)
#       visit user_path(@user1)
#       expect(page).to have_no_link 'フォローする'
#     end

#     it 'ログインしていないユーザーはユーザーをフォローすることができない' do
#       visit root_path
#       visit user_path(@user1)
#       expect(page).to have_no_link 'フォローする'
#     end
#   end
# end

RSpec.describe "ユーザーフォロー解除機能", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    FactoryBot.create(:rank_setting)
  end

  context 'ユーザーをフォロー解除できるとき' do
    it 'ログインしたユーザーはフォロー中の他のユーザーをフォロー解除することができる' do
      basic_pass root_path
      sign_in(@user1)
      visit user_path(@user2)
      click_link 'フォローする'
      expect(current_path).to eq(user_path(@user2))
      expect(page).to have_link 'フォローを外す'
      click_link 'フォローを外す'
      # expect{
      #   click_link 'フォローを外す'
      # }.to change { Relationship.count }.by(-1)
      # expect(page).to have_link 'フォローする'
    end
  end

  context 'ユーザーをフォロー解除できないとき' do
    it 'ログインしていないユーザーは他のユーザーをフォロー解除することができない' do
      visit root_path
      visit user_path(@user2)
      expect(page).to have_no_link 'フォローを外す'
    end
  end
end