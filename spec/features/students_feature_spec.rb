require 'rails_helper'

feature 'students' do
  scenario 'should display a pair of students' do
    visit root_path
    expect(page).to have_content 'Jon Snow'
    expect(page).to have_content 'Minnie Mouse'
  end

  scenario 'lists students names' do
    visit root_path
    student     = create(:student, name: 'Ronald McDonald')
    student_two = create(:student, name: 'Fred Flinstone')
    click_link('All students')
    expect(page).to have_content 'Ronald McDonald'
    expect(page).to have_content 'Fred Flintstone'
  end
end
