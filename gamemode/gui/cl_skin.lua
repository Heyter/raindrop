-- accidentally committed the CC skin

rain.skin = {}

function rain.skin.paintpanel(w, h, p, color)

	if !color then
		surface.SetDrawColor(120, 120, 120)
	else
		surface.SetDrawColor(color)
	end
	surface.DrawRect(0, 0, w, h)
end