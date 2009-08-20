########################
# CUSTOM EVENT CLASSES #
########################

# Signals sprites to draw themselves on the screen
class DrawSprites
	attr_accessor :screen
	def initialize( screen )
		@screen = screen
	end
end

# Signals sprites to erase themselves from the screen
class UndrawSprites
	attr_accessor :screen, :background
	def initialize( screen, background )
		@screen, @background = screen, background
	end
end
