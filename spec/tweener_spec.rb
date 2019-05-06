require 'spec_helper'

RSpec.describe Tsuku::Tweener do
  let(:target) { MockTarget.new(x: 1, y: 2, z: 3) }

  before do
    Tsuku::Tweener.add_tween(target, { x: 10 }, 1000)
    Tsuku::Tweener.add_tween(target, { y: 10 }, 2000)
  end
  
  it "advances tweens correctly" do
    Tsuku::Tweener.step(1000)
    expect(target.x).to eq(10)
  end

  it "does not advance tweens when paused" do
    Tsuku::Tweener.pause
    Tsuku::Tweener.step(1000)
    expect(target.x).to eq(1)
  end

  it "advances tweens when paused and resumed" do
    Tsuku::Tweener.pause
    Tsuku::Tweener.resume
    Tsuku::Tweener.step(1000)
    expect(target.x).to eq(10)
  end

  it "advances tweens correctly when earlier tween completes" do
    Tsuku::Tweener.step(1000)
    Tsuku::Tweener.step(1000)
    expect(target.y).to eq(10)
  end
end
