module AresMUSH
  module Chargen
    def self.custom_approval(char)
  
     case char.group("Faction")
        when "Marines"
          Channels.add_to_channels(nil, char, ["Marines"] )
        when "Air Force"
          Channels.add_to_channels(nil, char, ["Air Force"] )
	when "Civilian"
	  Channels.add_to_channels(nil, char, ["Civilians"] )
    end            
      # If you don't want to have any custom approval steps, just leave this blank.
      
      # Otherwise, do what you need to do.  Here's an example of how to add
      # someone to a role based on their faction:
      #
      #  faction = char.group("Faction")
      #  role = Role.find_by_name(faction)
      #
      #  if (role)
      #    char.roles.add role
      #  end
      #
      # See https://www.aresmush.com/tutorials/config/chargen.html for details.
    end
  end
end
