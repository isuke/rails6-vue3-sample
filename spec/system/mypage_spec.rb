require 'rails_helper'

RSpec.describe 'Mypage', type: :system do

  subject { page }

  context 'with login user' do
    let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    before { capybara_login user }
    before { visit '/mypage' }

    it 'is expected show page' do
      expect(subject).to have_content 'My Page'
      expect(subject).to have_content 'test@example.com'
      expect(subject).to have_link 'logout'
    end
  end

  context 'without login user' do
    before { visit '/mypage' }

    it 'is expected show login page' do
      expect(subject).not_to have_content 'My Page'
      expect(subject).to     have_content 'Login'
    end
  end
end
