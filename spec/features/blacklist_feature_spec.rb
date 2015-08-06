describe Blacklist do
  scenario 'viewing my blacklist' do
    student_1 = create(:student, name: "Mr Burns")
    student_2 = create(:student, name: "Ms Theo", email: "theo@me.com")
    blacklist = create(:blacklist, student_id: student_1.id, enemy_id: student_2.id)
    visit root_path
    within('ul.blacklist-dropdown') do
      click_link "Mr Burns"
    end
    within 'ul.blacklisted' do
      expect(page).to have_content 'Ms Theo'
      expect(page).not_to have_content 'Mr Burns'
    end
  end
  scenario 'adding an enemy to the blacklist' do
    student_1 = create(:student, name: "Alberquerque Jones")
    student_2 = create(:student, name: "Marvin Gaye", email: "marv@me.com")
    visit student_blacklist_index_path(student_1)
    within "ul.potential-partners" do 
      click_link "Marvin Gaye"
    end
    within 'ul.blacklisted' do
      expect(page).to have_content "Marvin Gaye"
    end
  end
end