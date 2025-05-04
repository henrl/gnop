extends HBoxContainer

func update_display(text):
	$ScoreCount.text = str(snapped(text, 1))
