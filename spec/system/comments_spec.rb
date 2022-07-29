require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Comments", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @post_comment = Faker::Lorem.sentence
  end

  context 'コメント投稿ができるとき' do
    it 'ログインしたユーザーはギア詳細画面に遷移してコメント投稿欄が表示される' do
      basic_pass root_path
      sign_in(@post.user)
      expect(page).to have_link @post.gearmodel
      visit post_path(@post)
      expect(page).to have_content("#{@post.gearmodel}")
      expect(page).to have_content("#{@post.text}")
      expect(page).to have_selector '#comment_text'
      fill_in 'コメントする', with: @post_comment
      expect{
        click_button '送信'
      }.to change { Comment.count }.by(1)
      expect(current_path).to eq(post_path(@post))
      expect(page).to have_content(@post_comment)
    end
  end

  context 'コメント投稿ができないとき' do
    it 'ログインしていないユーザーはギア詳細画面に遷移してもコメント投稿欄が表示されない' do
      visit root_path
      expect(page).to have_link @post.gearmodel
      visit post_path(@post)
      expect(page).to have_content("#{@post.gearmodel}")
      expect(page).to have_content("#{@post.text}")
      expect(page).to have_no_selector '#comment_text'
    end
  end

end
