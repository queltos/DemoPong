require "rubygems"
require "rubygame"

##################
# Obstacle CLASS #
##################

# Base class for our panda sprites. This provides the core
# logic for initialization and movement of the sprites.
class Obstacle
	include Sprites::Sprite
	include EventHandler::HasEventHandler

	# Autoload the "panda.png" image and set its colorkey
	@@pandapic = Surface["data/ball.png"]
	@@pandapic.set_colorkey(@@pandapic.get_at(0,0))

	attr_accessor :vx, :vy, :speed
	def initialize(x,y)
		super()
		@vx, @vy = 0,0
		@speed = 40
		@image = @@pandapic
		@rect = Rect.new(x,y,*@@pandapic.size)

	end

	def update_image(time)
		# do nothing in base class, rotate/zoom image in subs
	end

	def update( tick_event )
		x,y = @rect.center
		self.update_image( tick_event.seconds * 1000.0 )
		@rect.size = @image.size

		base = @speed * tick_event.seconds
		@rect.centerx = x + @vx * base
		@rect.centery = y + @vy * base
	end
end
