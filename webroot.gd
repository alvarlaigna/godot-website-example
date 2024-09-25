extends CanvasLayer

@onready var main_container = $MarginContainer/MainContainer
@onready var background = $Background
@onready var header = $MarginContainer/MainContainer/Header
@onready var content = $MarginContainer/MainContainer/Content
@onready var footer = $MarginContainer/MainContainer/Footer

const HEADER_FONT_SIZE = 28
const TITLE_FONT_SIZE = 46
const CONTENT_FONT_SIZE = 28
const FOOTER_FONT_SIZE = 26

func _ready():
	setup_background()
	setup_header()
	setup_content()
	setup_footer()

func setup_background():
	background.texture = load("res://background.jpg")

func setup_header():
	var logo = TextureRect.new()
	logo.texture = load("res://logo.png")
	logo.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	logo.custom_minimum_size = Vector2(100, 50) 
	header.add_child(logo)
	
	var menu = HBoxContainer.new()
	menu.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	menu.alignment = BoxContainer.ALIGNMENT_END
	
	var menu_items = ["Home", "About", "Contact"]
	for item in menu_items:
		var button = Button.new()
		button.text = item
		button.add_theme_font_size_override("font_size", HEADER_FONT_SIZE)
		menu.add_child(button)
	
	header.add_child(menu)

func setup_content():
	var title = Label.new()
	title.text = "Welcome to Our Website"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", TITLE_FONT_SIZE)
	content.add_child(title)
	
	var text = Label.new()
	text.text = "This is a simple layout created with Godot Engine."
	text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	text.add_theme_font_size_override("font_size", CONTENT_FONT_SIZE)
	content.add_child(text)

func setup_footer():
	var menu_items = ["Privacy Policy", "Terms of Service", "Contact Us"]
	for item in menu_items:
		var button = Button.new()
		button.text = item
		button.add_theme_font_size_override("font_size", FOOTER_FONT_SIZE)
		footer.add_child(button)
