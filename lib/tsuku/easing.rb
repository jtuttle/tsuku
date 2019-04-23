module Tsuku
  class Easing
    class << self
      def linear(t, b, c, d)
        c * t / d + b
      end

      def ease_in_quad(t, b, c, d)
        t /= d
        c * t * t + b
      end

      def ease_out_quad(t, b, c, d)
        t /= d
        -c * t * (t - 2) + b
      end

      def ease_in_out_quad(t, b, c, d)
        t /= d / 2
        return c / 2 * t * t + b if t < 1
        t -= 1
        -c / 2 * (t * (t - 2) - 1) + b
      end

      def ease_in_cubic(t, b, c, d)
        t /= d
        return c * t * t * t + b
      end

      def ease_out_cubic(t, b, c, d)
        t /= d
        t -= 1
        c * (t * t * t + 1) + b
      end

      def ease_in_out_cubic(t, b, c, d)
        t /= (d / 2)
        return c / 2 * t * t * t + b if t < 1
        t -= 2
        return c / 2 * (t * t * t + 2) + b
      end
    end
  end
end
