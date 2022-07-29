require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ギア登録機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_gearmodel = Faker::Name.name
    @post_text = Faker::Lorem.sentence
    FactoryBot.create(:rank_setting)
  end

  context 'ギア投稿ができるとき' do
    it 'ログインしたユーザーはギア投稿ができ、ギア投稿すると経験値が+1増えランクが上がる' do
      basic_pass root_path
      sign_in(@user)
      expect(page).to have_content('ギア登録')
      visit new_post_path
      attach_file 'gearimagepost', "#{Rails.root}/spec/fixtures/images/test.png"
      select 'テント', from: 'カテゴリー*'
      select 'コールマン(Coleman)', from: 'ブランド*'
      fill_in 'gearmodel', with: @post_gearmodel
      fill_in 'geartext', with: @post_text
      expect{
        click_on '登録する'
      }.to change { Post.count }.by(1)
      # expect(@user.exp_point).to eq 1
      # expect(@user.rank_name).to eq 'ルーキーⅢ'
    end
  end

  context 'ギア投稿ができないとき' do
    it 'ログインしていないユーザーはギア投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_content('ギア登録')
      visit new_post_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'ギア編集機能', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context 'ギア編集ができるとき' do
    it 'ログインしたユーザーは自分のギアを編集できる' do
      visit root_path
      sign_in(@post1.user)
      expect(page).to have_link @post1.gearmodel
      visit post_path(@post1)
      click_button '編集'
      attach_file 'gearimagepost', "#{Rails.root}/spec/fixtures/images/test2.png"
      select 'タープ', from: 'カテゴリー*'
      select 'スノーピーク(Snow Peak)', from: 'ブランド*'
      fill_in 'gearmodel', with: "#{@post1.gearmodel}+編集したモデル名"
      fill_in 'geartext', with: "#{@post1.text}+編集した説明"
      expect{
        click_on '更新する'
      }.to change { Post.count }.by(0)
      expect(current_path).to eq(post_path(@post1))
      expect(page).to have_content("#{@post1.gearmodel}+編集したモデル名")
      expect(page).to have_content("#{@post1.text}+編集した説明")
    end
  end

  context 'ギア編集ができないとき' do
    it 'ログインしたユーザーは自分以外のギアは編集できない' do
      sign_in(@post1.user)
      visit post_path(@post2)
      expect(page).to have_no_button '編集'
    end

    it 'ログインしていないユーザーはギア編集画面に遷移できない' do
      visit post_path(@post2)
      expect(page).to have_no_button '編集'
    end

  end
end

RSpec.describe 'ギア削除機能', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context 'ギア削除ができるとき' do
    it 'ログインしたユーザーは自分のギアを削除でき経験値が-1減りランクが下がる' do
      visit root_path
      sign_in(@post1.user)
      expect(page).to have_link @post1.gearmodel
      visit post_path(@post1)
      expect{
        click_button '削除'
      }.to change { Post.count }.by(-1)
      expect(current_path).to eq(root_path)
      expect(page).to have_no_content(@post1.gearmodel)
      # expect(@user.exp_point).to eq -1
      # expect(@user.rank_name).to eq 'ルーキーⅣ'
    end
  end

  context 'ギア削除ができないとき' do
    it 'ログインしたユーザーは自分以外のギアを削除できない' do
      sign_in(@post1.user)
      expect(page).to have_link @post2.gearmodel
      visit post_path(@post2)
      expect(page).to have_no_button '削除'
    end

    it 'ログインしていないユーザーはギア削除のボタンが表示されない' do
      visit post_path(@post2)
      expect(page).to have_no_button '削除'
    end
  end

end

RSpec.describe 'ギア詳細', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  it 'ログインしたユーザーはギア詳細画面に遷移してコメント投稿欄が表示される' do
    visit root_path
    sign_in(@post.user)
    expect(page).to have_link @post.gearmodel
    visit post_path(@post)
    expect(page).to have_content("#{@post.gearmodel}")
    expect(page).to have_content("#{@post.text}")
    expect(page).to have_selector '#comment_text'
  end

  it 'ログインしていないユーザーはギア詳細画面に遷移できるもののコメント投稿欄が表示されない' do
    visit root_path
    expect(page).to have_link @post.gearmodel
    visit post_path(@post)
    expect(page).to have_content("#{@post.gearmodel}")
    expect(page).to have_content("#{@post.text}")
    expect(page).to have_no_selector '#comment_text'
  end

end