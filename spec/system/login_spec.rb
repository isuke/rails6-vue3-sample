require 'rails_helper'

RSpec.describe 'Login', type: :system do

  subject { page }

  before { visit '/login' }

  let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  it 'is expected show page' do
    expect(subject).to have_content 'Login'
    expect(subject).to have_field 'email'
    expect(subject).to have_field 'password'
    expect(subject).to have_button 'Submit'
  end

  context 'when click submit button with valid values' do
    before do
      fill_in 'email'   , with: 'test@example.com'
      fill_in 'password', with: 'password'
      click_button 'Submit'
    end

    it 'is expected show mypage' do
      expect(subject).not_to have_content 'Login'
      expect(subject).to     have_content 'My Page'
    end
  end

  context 'when click submit button with invalid values' do
    before do
      fill_in 'email'   , with: 'test@example.com'
      fill_in 'password', with: 'wrong_password'
      click_button 'Submit'
    end

    it 'is expected show mypage' do
      expect(subject).to     have_content 'Login'
      expect(subject).not_to have_content 'My Page'
    end
  end
end
