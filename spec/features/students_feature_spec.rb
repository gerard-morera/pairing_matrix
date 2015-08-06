require 'rails_helper'

feature 'students' do
  scenario 'should display a pair of students' do
    create(:student, name: 'Jon Snow', email: "jon@me.com")
    create(:student, name: 'Minnie Mouse', email: 'minnie@me.com')
    visit root_path
    expect(page).to have_content 'Jon Snow'
    expect(page).to have_content 'Minnie Mouse'
  end

  scenario 'lists students names' do
    visit root_path
    student     = create(:student, name: 'Ronald McDonald', email: "ron@me.com")
    student_two = create(:student, name: 'Fred Flintstone', email: "fred@me.com")
    click_link('All students')
    expect(page).to have_content 'Ronald McDonald'
    expect(page).to have_content 'Fred Flintstone'
  end

  scenario 'lists who a student has paired with' do
    student     = create(:student, name: 'Pink Panther', email: "pink@me.com")
    student_two = create(:student, name: 'George W Bush', email: "georg@me.com")
    create_pair student, student_two
    visit student_partners_path(student)
    within 'ul#paired' do
      expect(page).to have_content 'George W Bush'
    end
  end

  scenario 'lists who a student has not paired with' do
    student = create(:student, name: 'Dracula', email: "drac@me.com")
    student_two = create(:student, name: 'Bugggs Bunny', email: "buggs@me.com")
    student_three = create(:student, name: 'Maggie Thatcher', email: "coldheart@me.com")
    create_pair student, student_two
    visit student_partners_path(student)
    within 'ul#unpaired' do
      expect(page).to have_content 'Maggie Thatcher'
    end
  end

  scenario 'logging in' do
    student = create(:student)
    student = create(:student, name: "Nick", email: "nick@me.com", password: "password123")
    visit root_path
    expect(page).to_not have_content "Sign out"
    click_link "Sign in"
    fill_in "Email", with: "homer@simpson.com"
    fill_in "Password", with: "homersimpson123"
    click_on "Log in"
    expect(page).to have_content "Sign out"
  end

  def create_pair student_one, student_two
    create(:pair, student_id: student_one.id, partner_id: student_two.id)
  end
end
