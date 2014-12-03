# Description:
#   Respond to groot
#

groot = [
  'I am groot.'
  'I am Groot!'
  'I AM GROOT!!!'
  'I! AM! GROOT!'
  'I am ... GROOT!'
  'I am Groot.'
  'I am Groot?'
  'https://www.youtube.com/watch?v=jM4Step_EXE'
  'Je suis Groot.'
  'Yo soy Groot.'
  'Yo soy ... Groot.'
  'https://www.youtube.com/watch?v=0j3wnwtUNxw'
]

module.exports = (robot) ->

  robot.hear /(.+) groot/i, (msg) ->
    msg.send msg.random groot
