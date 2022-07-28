require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ユーザー登録機能', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      basic_pass root_path
      find('.dropdown-toggle').click
      expect(page).to have_content('ユーザー登録')
      visit new_user_registration_path
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      find('.dropdown-toggle').click
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('ユーザー登録')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      find('.dropdown-toggle').click
      expect(page).to have_content('ユーザー登録')
      visit new_user_registration_path
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq(user_registration_path)
    end
  end

end

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザーログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      find('.dropdown-toggle').click
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
    end

    it 'ログインに成功し、トップページに遷移する' do
      visit new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on('ログイン')
      expect(current_path).to eq(root_path)
    end
  end

  context 'ユーザーログインができないとき' do
    it 'ログイン情報を間違えると、再びサインインページに戻ってくる' do
      visit new_post_path
      expect(current_path).to eq(new_user_session_path)
      another_user = FactoryBot.build(:user)
      fill_in 'email', with: another_user.email
      fill_in 'password', with: another_user.password
      click_on('ログイン')
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
