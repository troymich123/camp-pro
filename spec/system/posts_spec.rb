require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ギア登録機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  context 'ギア投稿ができるとき' do
    it 'ログインしたユーザーはギア投稿ができる' do
      sign_in(@user)
    end
  end

  context 'ギア投稿ができないとき' do
    it 'ログインしていないユーザーはギア投稿ページに遷移できない' do
    end
  end
end

RSpec.describe 'ギア編集機能', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context 'ギア編集ができるとき' do
    it 'ログインしたユーザーは自分のギアを編集できる' do
    end
  end

  context 'ギア編集ができないとき' do
    it 'ログインしたユーザーは自分以外のギアは編集できない' do
    end

    it 'ログインしていないユーザーはギア編集画面に遷移できない' do
    end

  end
end

RSpec.describe 'ギア削除機能', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context 'ギア削除ができるとき' do
    it 'ログインしたユーザーは自分のギアを削除できる' do
    end
  end

  context 'ギア削除ができないとき' do
    it 'ログインしたユーザーは自分以外のギアを削除できない' do
    end

    it 'ログインしていないユーザーはギア削除のボタンが表示されない' do
    end
  end

end

RSpec.describe 'ギア詳細', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  it '' do
  end
end