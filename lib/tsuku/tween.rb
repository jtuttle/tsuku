module Tsuku
  class Tween
    def initialize(target, final_property_values, duration_ms, easing = :linear)
      @target = target
      @final_property_values = final_property_values
      @duration_ms = duration_ms
      @easing = easing

      @running = false
      @elapsed_ms = 0.0
    end
    
    def start
      @initial_property_values = {}

      @final_property_values.each_key do |k|
        @initial_property_values[k] = @target.send(k)
      end

      @running = true
    end

    def step(delta_ms)    
      return if !@running
      
      @elapsed_ms += delta_ms

      if @elapsed_ms >= @duration_ms
        complete
        return
      end

      advance_property_values
    end

    def pause
      @running = false
    end

    def resume
      @running = true unless completed?
    end

    def reset
      @elapsed_ms = 0
    end

    def completed?
      @elapsed_ms >= @duration_ms
    end

    private
    
    def advance_property_values
      @final_property_values.each_key do |k|
        # Based on Penner's equations
        t = @elapsed_ms
        b = @initial_property_values[k]
        c = @final_property_values[k] - @initial_property_values[k]
        d = @duration_ms
        
        current_value = Easing.method(@easing).call(t, b, c, d)
        
        @target.send("#{k}=", current_value)
      end
    end

    def complete
      @elapsed_ms = @duration_ms
      
      @final_property_values.each do |k,v|
        @target.send("#{k}=", v)
      end

      @running = false
    end
  end
end
