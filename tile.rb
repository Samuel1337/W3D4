
class Tile

    attr_accessor :value, :revealed

    def initialize(value)
        @value = value
        @revealed = false
    end

    def reveal
        @revealed == false ? @revealed = true : @revealed = false
    end
end