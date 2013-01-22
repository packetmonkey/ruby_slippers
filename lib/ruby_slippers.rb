class RubySlippers
  def self.ensure_command(command, install_command)
    if command?(command)
      puts "#{command} is installed"
    else
      puts "Installing #{command}"
      system install_command
      if $? != 0
        puts "It appears there was a problem installing #{command}. Bailing out now."
        exit
      end
    end
  end

  def self.ensure_path(path)
    if ENV['PATH'].split(':').include?(path)
      puts "#{path} is in your $PATH."
    else
      puts "#{path} isn't in your $PATH. Fix that."
      exit
    end
  end

  def self.ensure_env(name, value)
    unless ENV[name] == value
      puts "You need to make sure #{name} is set to '#{value}'"
      exit
    end
  end

  private

  def self.command?(command)
    system "which #{ command} > /dev/null 2>&1"
  end
end
