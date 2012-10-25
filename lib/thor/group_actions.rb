class Thor::GroupActions < Thor::Group
  desc "Base class for Thor::Group with Actions, using the idiom of executing shell commands defined in a menu"

  include Thor::Actions

  # ============================
  # private methods
  # ============================
  private

  def execute(menu)
    # execute commands defined in menu
    commands = parse_commands(menu)
    run commands
  end

  def parse_commands(menu)
    # Helper method to parse a text menu of possible commands,
    # which may contain empty lines or commented out with #

    commands = []
    menu.split(/\r?\n/).each do |line|
      line = line.strip
      unless line.empty? or line.start_with?('#') # empty or commented out
        commands << line
      end
    end
    commands.join('; ')
  end

end

