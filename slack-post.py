import slackweb
import sys
 
total = len(sys.argv)
if total == 1:
	print 'Usage: ./slack-post.py "Hello World"'
	sys.exit()

msg = sys.argv[1] # Message

webhook = 'https://hooks.slack.com/services/webhook-secret-url'
slack = slackweb.Slack(url=webhook)
slack.notify(text=msg, channel="#bla-bla", username="8bit-bot", icon_emoji=":monkey_face:")
