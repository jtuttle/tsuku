require 'singleton'
require 'forwardable'

module Tsuku
  class Tweener
    include Singleton

    def initialize
      super
      
      @tweens = []
      @running = true
    end
    
    def add_tween(target, final_property_values, duration_ms, easing = :linear)
      tween = Tween.new(target, final_property_values, duration_ms, easing)
      tween.start
      
      @tweens << tween
    end

    def step(delta_ms)
      return if !@running

      @tweens.reverse_each do |tween|
        tween.step(delta_ms)

        if tween.completed?
          @tweens.delete(tween)
        end
      end
    end

    def pause
      @running = false
    end

    def resume
      @running = true
    end

    class << self
      extend Forwardable

      # delegate all instance methods to singleton instance to allow calling
      # methods without '.instance' (i.e. Tweener.add_tween)
      def_delegators :instance, *Tweener.instance_methods(false)
    end
  end
end
