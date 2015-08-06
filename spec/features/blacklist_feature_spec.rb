describe Blacklist do
  scenario 'viewing my blacklist' do
    student_1 = create(:student, name: "Mr Burns")
    student_2 = create(:student, name: "Ms Theo", email: "theo@me.com")
    blacklist = create(:blacklist, student_id: student_1.id, enemy_id: student_2.id)
    visit root_path
    sign_in_as student_1
      click_link "Blacklist"
    within 'ul.blacklisted' do
      expect(page).to have_content 'Ms Theo'
      expect(page).not_to have_content 'Mr Burns'
    end
  end
  scenario 'adding an enemy to the blacklist' do
    student_1 = create(:student, name: "Alberquerque Jones")
    student_2 = create(:student, name: "Marvin Gaye", email: "marv@me.com")
    visit root_path
    sign_in_as student_1
    visit student_blacklist_index_path(student_1)
    click_link "Marvin Gaye"
    within 'ul.blacklisted' do
      expect(page).to have_content "Marvin Gaye"
    end
  end

  def sign_in_as user
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end
end