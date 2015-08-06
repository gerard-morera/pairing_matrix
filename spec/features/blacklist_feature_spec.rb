describe Blacklist do
  scenario 'viewing my blacklist' do
    student_1 = create(:student, name: "Mr Burns")
    student_2 = create(:student, name: "Ms Theo")
    blacklist = create(:blacklist, student_id: student_1.id, enemy_id: student_2.id)
    visit root_path
    click_link "Blacklist"
    click_link "Mr Burns"
    # select "Mr Burns", from: 'blacklist'
    # visit student_blacklist_index_path(student_1)
    within 'ul.blacklisted' do
      expect(page).to have_content 'Ms Theo'
      expect(page).not_to have_content 'Mr Burns'
    end
  end
end