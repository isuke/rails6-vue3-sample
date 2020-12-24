require 'rails_helper'

RSpec.describe 'Signup', type: :system do

  subject { page }

  before { visit '/signup' }

  it 'is expected show page' do
    expect(subject).to have_content 'Sign Up'
    expect(subject).to have_field 'email'
    expect(subject).to have_field 'password'
    expect(subject).to have_field 'password_confirmation'
    expect(subject).to have_button 'Submit'
  end

  context 'when click submit button with valid values' do
    before do
      fill_in 'email'                , with: 'test@example.com'
      fill_in 'password'             , with: 'password'
      fill_in 'password_confirmation', with: 'password'
      click_button 'Submit'
    end

    it 'is expected show mypage' do
      expect(subject).to have_content 'My Page'
      expect(subject).to have_content 'test@example.com'
    end
  end

  context 'when click submit button with invalid values' do
    before do
      fill_in 'email'                , with: 'test@example.com'
      fill_in 'password'             , with: 'password'
      fill_in 'password_confirmation', with: 'wrang_password'
      click_button 'Submit'
    end

    it 'is expected don not show mypage' do
      expect(subject).to     have_content 'Sign Up'
      expect(subject).not_to have_content 'My Page'
    end
  end
end
