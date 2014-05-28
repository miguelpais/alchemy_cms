require 'spec_helper'

describe "element trash feature", js: true do
  let(:a_page) { FactoryGirl.create(:page) }

  before do
    authorize_as_admin
    visit edit_admin_page_path(a_page)
    create_element!
  end

  it "removes an element from the list" do
    expect(page).to have_selector(".element_editor", count: 1)
    within first("#alchemy_elements_window .element_editor") do
      click_link Alchemy::I18n.t("trash element")
    end
    expect(page).to have_content Alchemy::I18n.t('Element trashed')
    expect(page).to have_no_selector(".element_editor")
  end
end
