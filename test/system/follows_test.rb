# frozen_string_literal: true

require 'application_system_test_case'

class FollowsTest < ApplicationSystemTestCase
  setup do
    @follow = follows(:one)
  end

  test 'visiting the index' do
    visit follows_url
    assert_selector 'h1', text: 'Follows'
  end

  test 'creating a Follow' do
    visit follows_url
    click_on 'New Follow'

    click_on 'Create Follow'

    assert_text 'Follow was successfully created'
    click_on 'Back'
  end

  test 'updating a Follow' do
    visit follows_url
    click_on 'Edit', match: :first

    click_on 'Update Follow'

    assert_text 'Follow was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Follow' do
    visit follows_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Follow was successfully destroyed'
  end
end
