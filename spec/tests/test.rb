require 'spec_helper'

feature "Go to Google", :js => true do


  scenario "signs me in" do
    visit '/'
    fill_in 'q', with: 'Inuyasha'
    page.should have_content('Inuyasha')
  end
end
