local BaseInstance = import("./BaseInstance")
local Vector2 = import("../types/Vector2")
local typeof = import("../functions/typeof")
local TextService = BaseInstance:extend("TextService")

-- right now this is just a lazy [fontSize * len(text), fontSize] clipped by frameSize
function TextService.prototype:GetTextSize(text, fontSize, font, frameSize)
	if typeof(text) ~= "string" then
		error("text must be a string", 2)
	elseif typeof(fontSize) ~= "number" then
		error("fontSize must be a number", 2)
	elseif typeof(font) ~= "number" then
		error("font must be an Enum.Font", 2)
	elseif typeof(frameSize) ~= "Vector2" then
		error("frameSize must be a Vector2", 2)
	end

	local width = text:len()

	return Vector2.new(math.min(width, frameSize.X), math.min(fontSize, frameSize.Y))
end

return TextService