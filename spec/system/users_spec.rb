require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でギア投稿ページにアクセスした場合、サインインページに移動する' do
    basic_pass root_path
    visit new_post_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'inputemail', with: @user.email
    fill_in 'password', with: @user.password
    click_on('ログイン')
    expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    @user = FactoryBot.create(:user)
    visit new_post_path
    expect(current_path).to eq(new_user_session_path)
    another_user = FactoryBot.build(:user)
    fill_in 'inputemail', with: another_user.email
    fill_in 'password', with: another_user.password
    click_on('ログイン')
    expect(current_path).to eq(new_user_session_path)
  end
end
