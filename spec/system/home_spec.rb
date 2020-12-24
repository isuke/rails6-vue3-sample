require 'rails_helper'

RSpec.describe 'Home', type: :system do

  subject { page }

  before { visit '/home' }

  it 'is expected show page' do
    expect(subject).to have_content 'Home'
    expect(subject).to have_link 'Sign up', href: '/signup'
    expect(subject).to have_link 'Login'  , href: '/login'
  end

  context 'when click sign up link' do
    before { click_link 'Sign up' }

    it 'is expected show sign up page' do
      expect(subject).not_to have_content 'Home'
      expect(subject).to     have_content 'Sign Up'
    end
  end

  context 'when click login link' do
    before { click_link 'Login' }

    it 'is expected show sign up page' do
      expect(subject).not_to have_content 'Home'
      expect(subject).to     have_content 'Login'
    end
  end
end
