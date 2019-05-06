require 'spec_helper'

RSpec.describe Tsuku::Tween do
  let(:target) { MockTarget.new(x: 1, y: 2, z: 3) }
  
  let(:tween) { Tsuku::Tween.new(target, { x: 10, y: -10, z: 3 }, 1000) }

  it "does not advance if start was not called" do
    tween.step(1000)
    expect(target.x).to eq(1)
  end
  
  it "advances correctly when tweening in positive direction" do
    tween.start
    tween.step(1000)
    expect(target.x).to eq(10)
  end

  it "advances correctly when tweening in negative direction" do
    tween.start
    tween.step(1000)
    expect(target.y).to eq(-10)
  end

  it "advances correctly when target and initial values are the same" do
    tween.start
    tween.step(1000)
    expect(target.z).to eq(3)
  end
  
  it "does not tween past the target value" do
    tween.start
    tween.step(5000)
    expect(target.x).to eq(10)
  end

  it "does not advance when paused" do
    tween.start
    tween.step(500)
    tween.pause
    tween.step(500)
    expect(target.x).to eq(5.5)
  end

  it "resumes correctly after being paused and resumed" do
    tween.start
    tween.pause
    tween.resume
    tween.step(500)
    expect(target.x).to eq(5.5)
  end

  it "advances correctly after being completed and reset" do
    tween.start
    tween.step(1000)

    target.x = 0
    tween.reset
    tween.start
    tween.step(500)
    expect(target.x).to eq(5)
  end

  it "tweens correctly when property value changes after tween initialization" do
    target.x = 50
    tween.start
    tween.step(1000)
    expect(target.x).to eq(10)
  end

  describe "#completed?" do
    it "returns false when tween is not completed" do
      expect(tween.completed?).to eq(false)
    end
    
    it "returns true when tween is completed" do
      tween.start
      tween.step(1000)
      expect(tween.completed?).to eq(true)
    end
  end
end
