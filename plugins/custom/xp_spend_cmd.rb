module AresMUSH
    module Custom
        class XPSpendCmd
        # xp/spend <specialty>=<justification>
          include CommandHandler

          attr_accessor :skill_name, :skill_reason

          def pars_args
              args = cmd.parse_args(ArgParser.arg1_equals_arg2)
              self.skill_name = trim_arg(args.arg1)
              self.skill_reason = trim_arg(arg.args2)
          end

          def handle
            client.emit_success t('custom.xp_spent')
            subj = "XP Spend: #{skill_name}"
            Jobs.create_job("XP", subj, skill_reason, enactor)
          end

        end
      end
    end
