extends VBoxContainer

func _ready():
	# --- TopBar ---
	var topbar = get_node("TopBar")
	var topbar_style = StyleBoxFlat.new()
	topbar_style.bg_color = Color("#0d0d14")
	topbar_style.border_color = Color("#1e2030")
	topbar_style.border_width_bottom = 1
	topbar.add_theme_stylebox_override("panel", topbar_style)

	# --- XPBar ---
	var xpbar = get_node("XPBar")
	var xpbar_style = StyleBoxFlat.new()
	xpbar_style.bg_color = Color("#0d0d14")
	xpbar_style.border_color = Color("#1e2030")
	xpbar_style.border_width_bottom = 1
	xpbar.add_theme_stylebox_override("panel", xpbar_style)

	# --- LeftNav ---
	var leftnav = get_node("Body/LeftNav")
	var leftnav_style = StyleBoxFlat.new()
	leftnav_style.bg_color = Color("#0d0d14")
	leftnav_style.border_color = Color("#1e2030")
	leftnav_style.border_width_right = 1
	leftnav.add_theme_stylebox_override("panel", leftnav_style)

	# --- MainPanel ---
	var mainpanel = get_node("Body/MainPanel")
	var mainpanel_style = StyleBoxFlat.new()
	mainpanel_style.bg_color = Color("#0a0a0f")
	mainpanel.add_theme_stylebox_override("panel", mainpanel_style)

	# --- RightBar ---
	var rightbar = get_node("Body/RightBar")
	var rightbar_style = StyleBoxFlat.new()
	rightbar_style.bg_color = Color("#0d0d14")
	rightbar_style.border_color = Color("#1e2030")
	rightbar_style.border_width_left = 1
	rightbar.add_theme_stylebox_override("panel", rightbar_style)
