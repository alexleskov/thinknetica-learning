class Configuration

  def initialize
    load_sys_files
  end

  def load_sys_files
    require_relative 'route.rb'
    require_relative 'station.rb'
    require_relative 'train.rb'
    require_relative 'train_cargo.rb'
    require_relative 'train_passenger.rb'
    require_relative 'wagon.rb'
    require_relative 'wagon_cargo.rb'
    require_relative 'wagon_passenger.rb'
    require_relative 'railroad.rb'
    require_relative 'interface.rb'
  end

end
