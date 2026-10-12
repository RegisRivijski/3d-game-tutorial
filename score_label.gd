extends Label

var score = 0

func _on_mob_squashed():
	score += 1
	#text = 'Score: %s' % str(score)
	#text = 'Score: ' + str(score)
	#text = 'Score: {0}'.format([str(score)])
	text = 'Score: {points}'.format({ 'points': str(score) })
