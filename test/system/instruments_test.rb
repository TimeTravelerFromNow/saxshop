require "application_system_test_case"

class InstrumentsTest < ApplicationSystemTestCase
  setup do
    @instrument = instruments(:one)
  end

  test "visiting the index" do
    visit instruments_url
    assert_selector "h1", text: "Instruments"
  end

  test "should create instrument" do
    visit instruments_url
    click_on "New instrument"

    fill_in "Condition", with: @instrument.condition
    fill_in "Details", with: @instrument.details
    fill_in "Manafacturer", with: @instrument.manafacturer
    fill_in "Model type", with: @instrument.model_type
    fill_in "Price", with: @instrument.price
    fill_in "Serial no", with: @instrument.serial_no
    fill_in "Year", with: @instrument.year
    click_on "Create Instrument"

    assert_text "Instrument was successfully created"
    click_on "Back"
  end

  test "should update Instrument" do
    visit instrument_url(@instrument)
    click_on "Edit this instrument", match: :first

    fill_in "Condition", with: @instrument.condition
    fill_in "Details", with: @instrument.details
    fill_in "Manafacturer", with: @instrument.manafacturer
    fill_in "Model type", with: @instrument.model_type
    fill_in "Price", with: @instrument.price
    fill_in "Serial no", with: @instrument.serial_no
    fill_in "Year", with: @instrument.year
    click_on "Update Instrument"

    assert_text "Instrument was successfully updated"
    click_on "Back"
  end

  test "should destroy Instrument" do
    visit instrument_url(@instrument)
    click_on "Destroy this instrument", match: :first

    assert_text "Instrument was successfully destroyed"
  end
end
