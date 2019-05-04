require 'spec_helper'

RSpec.describe Tsuku::Easing do
  let(:elapsed_ms) { 500 }
  let(:duration_ms) { 1000 }
  let(:initial_value) { 10 }
  let(:final_value) { 20 }
  let(:value_delta) { final_value - initial_value }
  
  it "computes linear easing correctly" do
    value = Tsuku::Easing.linear(
      elapsed_ms,
      initial_value,
      value_delta,
      duration_ms
    )

    expect(value).to eq(15)
  end
end
