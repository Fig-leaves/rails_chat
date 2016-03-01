# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  particleCount = 10
  particles = []
  W = window.innerWidth * .9
  H = window.innerHeight * .9
  canvas = $("#canvas").get(0)
  canvas.width = W
  canvas.height = H
  ctx = canvas.getContext("2d")
  
  
  class Particle
    constructor: ->
      @x = Math.random() * W
      @y = Math.random() * H
      @direction =
        x: -1 + Math.random() * 2
        y: -1 + Math.random() * 2
      @vx = 2 * Math.random() + 4
      @vy = 2 * Math.random() + 4
      @radius = .9 * Math.random() + 1

    move: ->
      @x += @vx * @direction.x
      @y += @vy * @direction.y
      return

    changeDirection : (axis) ->
        @direction[axis] *= -1
        return

    draw : ->
        ctx.beginPath()
        ctx.fillStyle = "rgba(255,255,122,.9)"
        ctx.arc @x, @y, @radius, 0, Math.PI * 2, false
        ctx.fill()
        return

    boundaryCheck : ->
      if @x >= W
        @x = W
        @changeDirection "x"
      else if @x <= 0
        @x = 0
        @changeDirection "x"
      if @y >= H
        @y = H
        @changeDirection "y"
      else if @y <= 0
        @y = 0
        @changeDirection "y"
      return

  #end particle class
  clearCanvas = ->
    ctx.clearRect 0, 0, W, H
    return
  #end clear canvas
  createParticles = ->
    i = particleCount - 1

    while i >= 0
      p = new Particle()
      particles.push p
      i--
    return
 
  # end createParticles
  drawParticles = ->
    i = particleCount - 1

    while i >= 0
      p = particles[i]
      p.draw()
      i--
    return
  #end drawParticles
  updateParticles = ->
    i = particles.length - 1

    while i >= 0
      p = particles[i]
      p.move()
      p.boundaryCheck()
      i--
    return
  #end updateParticles
  
  initParticleSystem = ->
    createParticles()
    drawParticles()
    return
  
  animateParticles = ->
    clearCanvas()
    drawParticles()
    updateParticles()
    requestAnimationFrame(animateParticles)
    return
  
  initParticleSystem()
  requestAnimationFrame animateParticles
  return
