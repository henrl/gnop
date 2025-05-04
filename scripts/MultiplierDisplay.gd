extends HBoxContainer

func update_display(text):
	$MultiplierCount.text = "X " + str(snapped(text, 0.1))
