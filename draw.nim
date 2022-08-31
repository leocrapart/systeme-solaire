import drawim
import std/math

var delta = 0

setFrameRate(60)


type 
  PlanetParam = object 
    orbital_radius: float
    orbital_period: float
    initial_angle: float
    radius: float
    color: string


proc draw_sun() =
  fill("#f59e0b")
  circleFill(0, 0, 50)

proc draw_planet(delta: int, planet_param: PlanetParam) =
  var r = planet_param.orbital_radius
  var orbital_period = planet_param.orbital_period
  var initial_angle = planet_param.initial_angle
  var seconds_elapsed = delta / 60
  var angle = initial_angle + (360/orbital_period) * (seconds_elapsed mod orbital_period) 
  var theta = degToRad(angle)
  var x = r * cos(theta)
  var y = - r * sin(theta)
  fill(planet_param.color)
  circleFill(x, y, planet_param.radius)


proc draw() =
  background(0)
  fill(255, 0, 0)
  translate(int(width / 2), int(height / 2))
  # rectFill(-100,-100,100,100)

  draw_sun()
  

  var mercure_param = PlanetParam(
    orbital_radius: 75.0,
    orbital_period: 10.0,
    initial_angle: -90.0,
    radius: 10.0,
    color: "#ef4444"
  )

  var venus_param = PlanetParam(
    orbital_radius: 100.0,
    orbital_period: 15.0,
    initial_angle: 45.0,
    radius: 12.0,
    color: "#9333ea"
  )

  var earth_param = PlanetParam(
    orbital_radius: 150.0,
    orbital_period: 20.0,
    initial_angle: 0.0,
    radius: 15.0,
    color: "#0891b2"
  )

  draw_planet(delta, mercure_param)
  draw_planet(delta, venus_param)
  draw_planet(delta, earth_param)


  delta += 1
  echo delta / 60





run(600, 400, draw, name = "systeme solaire")