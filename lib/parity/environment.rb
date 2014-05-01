module Parity
  class Environment
    def initialize(environment, subcommands)
      self.environment = environment
      self.subcommand = subcommands[0]
      self.arguments = subcommands[1..-1]
    end

    def run
      if self.class.private_method_defined?(subcommand)
        send(subcommand)
      else
        run_via_cli
      end
    end

    private

    attr_accessor :environment, :subcommand, :arguments

    def open
      run_via_cli
    end

    def run_via_cli
      Kernel.system "hk #{pass_through} -a #{environment}"
    end

    def backup
      Kernel.system "hk pgbackups:capture --expire -a #{environment}"
    end

    def console
      Kernel.system "hk run rails console -a #{environment}"
    end

    def log2viz
      Kernel.system "open https://log2viz.herokuapp.com/app/#{heroku_app_name}"
    end

    def migrate
      Kernel.system %{
        hk run rake db:migrate -a #{environment} &&
        hk restart -a #{environment}
      }
    end

    def tail
      Kernel.system "hk logs --tail -a #{environment}"
    end

    def heroku_app_name
      [basename, environment].join('-')
    end

    def basename
      Parity.config.heroku_app_basename || Dir.pwd.split('/').last
    end

    def pass_through
      [subcommand, arguments].join(' ').strip
    end
  end
end
