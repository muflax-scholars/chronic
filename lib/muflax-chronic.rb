require 'time'
require 'date'

# Parse natural language dates and times into Time or {Chronic::Span} objects
#
# @example
#   require 'chronic'
#
#   Time.now   #=> Sun Aug 27 23:18:25 PDT 2006
#
#   Chronic.parse('tomorrow')
#     #=> Mon Aug 28 12:00:00 PDT 2006
#
#   Chronic.parse('monday', :context => :past)
#     #=> Mon Aug 21 12:00:00 PDT 2006
#
#   Chronic.parse('this tuesday 5:00')
#     #=> Tue Aug 29 17:00:00 PDT 2006
#
#   Chronic.parse('this tuesday 5:00', :ambiguous_time_range => :none)
#     #=> Tue Aug 29 05:00:00 PDT 2006
#
#   Chronic.parse('may 27th', :now => Time.local(2000, 1, 1))
#     #=> Sat May 27 12:00:00 PDT 2000
#
#   Chronic.parse('may 27th', :guess => false)
#     #=> Sun May 27 00:00:00 PDT 2007..Mon May 28 00:00:00 PDT 2007
#
# @author Tom Preston-Werner, Lee Jarvis
module Chronic
  VERSION = "0.7"

  class << self

    # @return [Boolean] true when debug mode is enabled
    attr_accessor :debug

    # @example
    #   require 'chronic'
    #   require 'active_support/time'
    #
    #   Time.zone = 'UTC'
    #   Chronic.time_class = Time.zone
    #   Chronic.parse('June 15 2006 at 5:54 AM')
    #     # => Thu, 15 Jun 2006 05:45:00 UTC +00:00
    #
    # @return [Time] The time class Chronic uses internally
    attr_accessor :time_class

    # The current Time Chronic is using to base from
    #
    # @example
    #   Time.now #=> 2011-06-06 14:13:43 +0100
    #   Chronic.parse('yesterday') #=> 2011-06-05 12:00:00 +0100
    #
    #   now = Time.local(2025, 12, 24)
    #   Chronic.parse('tomorrow', :now => now) #=> 2025-12-25 12:00:00 +0000
    #
    # @return [Time, nil]
    attr_accessor :now
  end

  self.debug = false
  self.time_class = Time
end

require 'muflax-chronic/chronic'
require 'muflax-chronic/handler'
require 'muflax-chronic/handlers'
require 'muflax-chronic/mini_date'
require 'muflax-chronic/tag'
require 'muflax-chronic/span'
require 'muflax-chronic/token'
require 'muflax-chronic/grabber'
require 'muflax-chronic/pointer'
require 'muflax-chronic/scalar'
require 'muflax-chronic/ordinal'
require 'muflax-chronic/separator'
require 'muflax-chronic/time_zone'
require 'muflax-chronic/numerizer'
require 'muflax-chronic/season'

require 'muflax-chronic/repeater'
require 'muflax-chronic/repeaters/repeater_year'
require 'muflax-chronic/repeaters/repeater_season'
require 'muflax-chronic/repeaters/repeater_season_name'
require 'muflax-chronic/repeaters/repeater_month'
require 'muflax-chronic/repeaters/repeater_month_name'
require 'muflax-chronic/repeaters/repeater_fortnight'
require 'muflax-chronic/repeaters/repeater_week'
require 'muflax-chronic/repeaters/repeater_weekend'
require 'muflax-chronic/repeaters/repeater_weekday'
require 'muflax-chronic/repeaters/repeater_day'
require 'muflax-chronic/repeaters/repeater_day_name'
require 'muflax-chronic/repeaters/repeater_day_portion'
require 'muflax-chronic/repeaters/repeater_hour'
require 'muflax-chronic/repeaters/repeater_minute'
require 'muflax-chronic/repeaters/repeater_second'
require 'muflax-chronic/repeaters/repeater_time'

class Time
  def self.construct(year, month = 1, day = 1, hour = 0, minute = 0, second = 0)
    warn "Chronic.construct will be deprecated in version 0.7.0. Please use Chronic.construct instead"
    Chronic.construct(year, month, day, hour, minute, second)
  end

  def to_minidate
    warn "Time.to_minidate will be deprecated in version 0.7.0. Please use Chronic::MiniDate.from_time(time) instead"
    Chronic::MiniDate.from_time(self)
  end
end
