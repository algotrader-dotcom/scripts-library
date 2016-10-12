import slackweb
import sys
 
total = len(sys.argv)
if total == 1:
	print 'Usage: ./slack-post.py "Hello World" "#channel"'
	sys.exit()

msg = sys.argv[1] # Message
channel = sys.argv[2] # Channel

webhook = 'https://hooks.slack.com/services/T0G79DMUM/B2LHZRAV8/secret-string'
slack = slackweb.Slack(url=webhook)
slack.notify(text=msg, channel=channel, username="8bit-bot", icon_emoji=":monkey_face:")
