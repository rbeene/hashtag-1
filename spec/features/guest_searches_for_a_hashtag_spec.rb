require 'spec_helper'

feature 'Guest searches for a hashtag' do
  scenario 'displays search results' do
    visit root_path
    search_for("#rails")

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'searches without a hashtag' do
    visit root_path
    search_for("rails")

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'updates search results' do
    visit root_path
    search_for("#ruby")

    expect(current_path).to eq '/searches/ruby'
    expect(page).to have_css 'li', text: /#ruby/i, count: 15
  end

  def search_for(term)
    fill_in 'Search', with: term
    click_on 'Submit'
  end
end
