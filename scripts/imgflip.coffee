# Description:
#   Generates memes via the Imgflip Meme Generator API.
#   Adapted from imgflip script: https://github.com/dylanwenzlau/hubot-scripts/commit/6db48d050f32739dd4ba90b49df2ee8fbefecdb6
#
# Dependencies:
#   None
#
# Configuration:
#   IMGFLIP_API_USERNAME [optional, overrides default imgflip_hubot account]
#   IMGFLIP_API_PASSWORD [optional, overrides default imgflip_hubot account]
#
# Commands:
#   hubot One does not simply <text> - Lord of the Rings Boromir
#   hubot I don't always <text> but when i do <text> - The Most Interesting man in the World
#   hubot aliens <text> - Ancient Aliens History Channel Guy
#   hubot grumpy cat <text> - Grumpy Cat with text on the bottom
#   hubot <text>, <text> everywhere - X, X Everywhere (Buzz and Woody from Toy Story)
#   hubot Not sure if <text> or <text> - Futurama Fry
#   hubot Y U NO <text> - Y U NO Guy
#   hubot Brace yourselves <text> - Brace Yourselves X is Coming (Imminent Ned, Game of Thrones)
#   hubot <text> all the <text> - X all the Y
#   hubot <text> that would be great - Bill Lumbergh from Office Space
#   hubot <text> too damn <text> - The rent is too damn high
#   hubot Yo dawg <text> so <text> - Yo Dawg Heard You (Xzibit)
#   hubot <text> you're gonna have a bad time - Super Cool Ski Instructor from South Park
#   hubot Am I the only one around here <text> - The Big Lebowski
#   hubot What if I told you <text> - Matrix Morpheus
#   hubot <text> ain't nobody got time for that
#   hubot <text> I guarantee it - George Zimmer
#   hubot <text> and it's gone - South Park Banker Guy
#   hubot <text> nobody bats an eye <text> everyone loses their minds - Heath Ledger Joker
#   hubot back in my day <text> - Grumpy old man
#   hubot Y U NO <text>  - Generates the Y U NO GUY with the bottom caption of <text>
#   hubot I don't always <something> but when i do <text> - Generates The Most Interesting man in the World
#   hubot <text> ORLY? - Generates the ORLY? owl with the top caption of <text>
#   hubot <text> (SUCCESS|NAILED IT) - Generates success kid with the top caption of <text>
#   hubot <text> ALL the <things> - Generates ALL THE THINGS
#   hubot <text> TOO DAMN <high> - Generates THE RENT IS TOO DAMN HIGH guy
#   hubot good news everyone! <news> - Generates Professor Farnsworth
#   hubot khanify <text> - TEEEEEEEEEEEEEEEEEXT!
#   hubot Not sure if <text> or <text> - Generates Futurama Fry
#   hubot Yo dawg <text> so <text> - Generates Yo Dawg
#   hubot ALL YOUR <text> ARE BELONG TO US - Generates Zero Wing with the caption of <text>
#   hubot if <text>, <word that can start a question> <text>? - Generates Philosoraptor
#   hubot <text> FUCK YOU - Angry Linus
#   hubot (Oh|You) <text> (Please|Tell) <text> - Willy Wonka
#   hubot <text> you're gonna have a bad time - Bad Time Ski Instructor
#   hubot one does not simply <text> - Lord of the Rings Boromir
#   hubot it looks like (you|you're) <text> - Generates Clippy
#   hubot AM I THE ONLY ONE AROUND HERE <text> - The Big Lebowski
#   hubot <text> NOT IMPRESSED - Generates McKayla Maroney
#   hubot PREPARE YOURSELF <text> - Generates GoT
#   hubot WHAT IF I TOLD YOU <text> - Generates Morpheus
#   hubot <text> BETTER DRINK MY OWN PISS - Generates Bear Grylls
#   hubot INTERNET KID <text>, <text> - Generates First-day-on-the-Internet Kid
#   hubot not sure if <something> or <something else> - Generates a Futurama Fry meme
#   hubot <something> is bad and you should feel bad - Generates a Zoidberg meme
#   hubot <things> are bad and you should feel bad - Generates a Zoidberg meme
#   hubot <question> why not zoidberg? - Generates a Why Not Zoidberg? meme
#   hubot <something> does not work that way! - Generates a Morbo meme
#   hubot <things> do not work that way! - Generates a Morbo meme
#   hubot <text>, I don't want to live <text> - Shows the Professor's "don't want to live on this planet anymore" meme
#   hubot <text>, shut up and take my money - Shows the Fry meme
#
# Author:
#   dylanwenzlau
#   impleri


inspect = require('util').inspect

module.exports = (robot) ->
  unless robot.brain.data.imgflip_memes?
    robot.brain.data.imgflip_memes = [
      {
        regex: /(one does not simply) (.*)/i,
        template_id: 61579
      },
      {
        regex: /(i don'?t always .*) (but when i do,? .*)/i,
        template_id: 61532
      },
      {
        regex: /(.* )?aliens(.*)/i,
        template_id: 101470
      },
      {
        regex: /(.* )?grumpy\s*cat (.*)/i,
        template_id: 405658
      },
      {
        regex: /(.*),? (\1 everywhere)/i,
        template_id: 347390
      },
      {
        regex: /(not sure if .*) (or .*)/i,
        template_id: 61520
      },
      {
        regex: /(y u no) (.+)/i,
        template_id: 61527
      },
      {
        regex: /(brace yoursel[^\s]+) (.*)/i,
        template_id: 61546
      },
      {
        regex: /(.*)?(all the .*)/i,
        template_id: 61533
      },
      {
        regex: /(.*) (that would be great|that'?d be great)/i,
        template_id: 563423
      },
      {
        regex: /(.*) (\w+\stoo damn .*)/i,
        template_id: 61580
      },
      {
        regex: /(yo dawg .*) (so .*)/i,
        template_id: 101716
      },
      {
        regex: /(.*) (.* gonna have a bad time)/i,
        template_id: 100951
      },
      {
        regex: /(am i the only one around here) (.*)/i,
        template_id: 259680
      },
      {
        regex: /(what if i told you) (.*)/i,
        template_id: 100947
      },
      {
        regex: /(.*) (ain'?t nobody got time for? that)/i,
        template_id: 442575
      },
      {
        regex: /(.*) (i guarantee it)/i,
        template_id: 10672255
      },
      {
        regex: /(.*) (a+n+d+ it'?s gone)/i,
        template_id: 766986
      },
      {
        regex: /(.* bats an eye) (.* loses their minds?)/i,
        template_id: 1790995
      },
      {
        regex: /(back in my day) (.*)/i,
        template_id: 718432
      },
      {
        regex: /(.*) (success|nailed it)/i,
        template_id: 61544
      },
      {
        regex: /(all your .*) (are belong to .*)/i,
        template_id: 4503404
      },
      {
        regex: /(if .*), ((are|can|do|does|how|is|may|might|should|then|what|when|where|which|who|why|will|won\'?t|would) .*)/i,
        template_id: 61516
      },
      {
        regex: /(.* )?bitch please (.*)/i,
        template_id: 109015
      },
      {
        regex: /(.* )?courage (.*)/i,
        template_id: 61517
      },
      {
        regex: /(.*)(o\s*rly\??.*)/i,
        template_id: 38909060
      },
      {
        regex: /(good news everyone[,.!]?) (.*)/i,
        template_id: 19346558
      },
      {
        regex: /(.*) (fuck you)/i,
        template_id: 26614318
      },
      {
        regex: /(it looks like you\'?re|it looks like you) (.*)/i,
        template_id: 21047462
      },
      {
        regex: /(.*) (not impressed*)/i,
        template_id: 117402
      },
      {
        regex: /(.*) (better drink my own piss)/i,
        template_id: 61548
      },
      {
        regex: /internet kid\s*([^,]*),?(.*)/i,
        template_id: 71851
      },
      {
        regex: /(.* is bad) (and you should feel bad)/i,
        template_id: 35747
      },
      {
        regex: /(.* are bad) (and you should feel bad)/i,
        template_id: 35747
      },
      {
        regex: /(.*) (why not zoidberg\??)/i,
        template_id: 61573
      },
      {
        regex: /(.*) (do(es)? not work that way)/i,
        template_id: 11906648
      },
      {
        regex: /(.* )?(don\'?t want to live .*)/i,
        template_id: 21975954
      },
      {
        regex: /(.* )?(shut up and take my money)/i,
        template_id: 176908
      }
    ]

  for meme in robot.brain.data.imgflip_memes
    setupResponder robot, meme

khanify = (msg) ->
  msg = msg.toUpperCase()
  vowels = [ 'A', 'E', 'I', 'O', 'U' ]
  index = -1
  for v in vowels when msg.lastIndexOf(v) > index
    index = msg.lastIndexOf(v)

  "#{msg.slice 0, index}#{Array(10).join msg.charAt(index)}#{msg.slice index}!!!!!"


setupResponder = (robot, meme) ->
  robot.respond meme.regex, (msg) ->
    generateMeme msg, meme.template_id, msg.match[1], msg.match[2]

  robot.respond /k(ha|ah)n(ify)? (.*)/i, (msg) ->
    template = 21333251
    generateMeme msg, template, "", khanify msg.match[3]

  robot.respond /((Oh|You) .*) ((Please|Tell) .*)/i, (msg) ->
    generateMeme msg, 61582, msg.match[1], msg.match[3]

generateMeme = (msg, template_id, text0, text1) ->
  username = process.env.IMGFLIP_API_USERNAME
  password = process.env.IMGFLIP_API_PASSWORD

  if (username or password) and not (username and password)
    msg.reply 'To use your own Imgflip account, you need to specify username and password!'
    return

  if not username
    username = 'imgflip_hubot'
    password = 'imgflip_hubot'

  msg.http('https://api.imgflip.com/caption_image')
  .query
      template_id: template_id,
      username: username,
      password: password,
      text0: text0,
      text1: text1
  .post() (error, res, body) ->
    if error
      msg.reply "I got an error when talking to imgflip:", inspect(error)
      return

    result = JSON.parse(body)
    success = result.success
    errorMessage = result.error_message

    if not success
      msg.reply "Imgflip API request failed: #{errorMessage}"
      return

    msg.send result.data.url
