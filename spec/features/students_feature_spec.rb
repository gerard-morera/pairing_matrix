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
    student_two = create(:student, name: 'Fred Flintstone')
    click_link('All students')
    expect(page).to have_content 'Ronald McDonald'
    expect(page).to have_content 'Fred Flintstone'
  end

  scenario 'lists who a student has paired with' do
    student     = create(:student, name: 'Pink Panther')
    student_two = create(:student, name: 'George W Bush')
    create_pair student, student_two
    visit root_path
    click_link('Pairing History')
    select "Pink Panther", from: "studentsSelect"
    # expect(page).to have_content 'George W Bush - yes'
    within 'ul#paired' do
      expect(page).to have_content 'George W Bush'
    end
  end

  def create_pair student_one, student_two
    create(:pair, student_id: student_one.id, partner_id: student_two.id)
  end
end
