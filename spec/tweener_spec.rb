require 'spec_helper'

RSpec.describe Tsuku::Tweener do
  let(:target) { MockTarget.new(x: 0, y: 0, z: 0) }

  before do
    Tsuku::Tweener.add_tween(target, { x: 10 }, 1000)
    Tsuku::Tweener.add_tween(target, { y: 10 }, 2000)
  end

  it "returns added tween" do
    expect(Tsuku::Tweener.add_tween(target, { x: 10 }, 1000)).
      to be_a(Tsuku::Tween)
  end
  
  it "advances tweens correctly" do
    Tsuku::Tweener.step(500)
    expect(target.x).to eq(5)
  end

  it "does not advance tweens when paused" do
    Tsuku::Tweener.pause
    Tsuku::Tweener.step(1000)
    expect(target.x).to eq(0)
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

  it "deletes tween correctly" do
    tween = Tsuku::Tweener.add_tween(target, { z: 10 }, 2000)
    Tsuku::Tweener.delete_tween(tween)
    Tsuku::Tweener.step(1000)

    expect(target.z).to eq(0)
  end
end
