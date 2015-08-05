require 'rails_helper'

feature 'students' do
  scenario 'should display a pair of students' do
    student     = create(:student, name: 'Jon Snow')
    student_two = create(:student, name: 'Minnie Mouse')
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
    visit student_partners_path(student)
    within 'ul#paired' do
      expect(page).to have_content 'George W Bush'
    end
  end

  scenario 'lists who a student has not paired with' do
    student = create(:student, name: 'Dracula')
    student_two = create(:student, name: 'Bugggs Bunny')
    student_three = create(:student, name: 'Maggie Thatcher')
    create_pair student, student_two
    visit student_partners_path(student)
    within 'ul#unpaired' do
      expect(page).to have_content 'Maggie Thatcher'
    end
  end

  def create_pair student_one, student_two
    create(:pair, student_id: student_one.id, partner_id: student_two.id)
  end
end
