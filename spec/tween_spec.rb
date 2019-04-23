require 'spec_helper'

RSpec.describe Tsuku::Tween do
  let(:target) { MockTarget.new(x: 1, y: 2, z: 3) }
  
  let(:tween) { Tsuku::Tween.new(target, { x: 10, y: -10, z: 3 }, 1000) }
  
  it "tweens correctly in positive direction" do
    tween.start
    tween.step(1000)
    expect(target.x).to eq(10)
  end

  it "tweens correctly in negative direction" do
    tween.start
    tween.step(1000)
    expect(target.y).to eq(-10)
  end

  it "tweens correctly when target property does not change" do
    tween.start
    tween.step(1000)
    expect(target.z).to eq(3)
  end
  
  it "does not tween past target value" do
    tween.start
    tween.step(5000)
    expect(target.x).to eq(10)
  end

  it "tweens correctly when property value changes after tween initialization" do
    target.x = 50
    tween.start
    tween.step(1000)
    expect(target.x).to eq(10)
  end

  it "computes intermediate value correctly (linear easing)" do
    tween.start
    tween.step(500)
    expect(target.x).to eq(5.5)
  end
end
