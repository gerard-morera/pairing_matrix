require 'rails_helper'

feature 'students' do
  scenario 'should display a pair of students' do
    visit root_path
    expect(page).to have_content 'Jon Snow'
    expect(page).to have_content 'Minnie Mouse'
  end
end
