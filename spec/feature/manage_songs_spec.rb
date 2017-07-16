require 'rails_helper'

feature 'Manage songs', js: true do
  scenario 'add a new song' do
    # Point your browser towards the song path
    visit 'http://localhost:3000/artists/26/songs'

    # Enter description in the text field
    fill_in 'song_title', with: 'Be Batman'

    # Press enter (to submit the form)
    page.execute_script("$('form').submit()")

    # Expect the new song to be displayed in the list of songs
    expect(page).to have_content('Be Batman')
  end
end
