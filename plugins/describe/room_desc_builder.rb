module AresMUSH
  module Describe
    class RoomDescBuilder
      def self.build(room)
        desc = "#{room.description}"

        time_of_day = ICTime.time_of_day(room.area_name).titleize
        if (room.vistas && room.vistas.has_key?(time_of_day))
          desc << " "
          desc << room.vistas[time_of_day]
        end

        season = ICTime.season(room.area_name).titleize
        if (room.vistas && room.vistas.has_key?(season))
          desc << " "
          desc << room.vistas[season]
        end

        weather = weather(room)
        if (weather)
          desc << " "
          desc << weather
        end

        desc
      end

      def self.weather(room)
        w = nil
        if Manage.is_extra_installed?("openweather")
          if (AresMUSH::Openweather.is_enabled?)
            w = Openweather.weather_for_area(room.area_name)
          end
        end
        if !w && Weather.is_enabled?
          w = Weather.weather_for_area(room.area_name)
        end
        w ? "%R%R#{w}" : nil
      end
    end
  end
end
