module AresMUSH
  module Describe
    class LookCmd
      include AresMUSH::Plugin
      
      attr_accessor :target
      
      # Validators
      must_be_logged_in
      no_switches
            
      def after_initialize
        RendererFactory.build_renderers
      end
      
      def want_command?(client, cmd)
        cmd.root_is?("look")
      end
      
      def crack!
        cmd.crack!(/(?<target>.+)/)
        self.target = trim_input(cmd.args.target) || 'here'
      end
      
      def handle
        find_result = VisibleTargetFinder.find(target, client)
        if (!find_result.found?)
          client.emit_failure(find_result.error)
          return
        end

        model = find_result.target
        desc = Describe.get_desc(model)
        client.emit(desc)
      end      
    end
  end
end