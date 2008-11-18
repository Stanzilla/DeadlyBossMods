local mod = DBM:NewMod("Kronus", "DBM-Party-WotLK", 6)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(28923)
mod:SetZone()

mod:RegisterCombat("combat")

local warningNova	= mod:NewAnnounce("WarningNova", 3, 53960)

mod:RegisterEvents(
	"SPELL_CAST_START"
)

function mod:SPELL_CAST_START(args)
	if args.spellId == 53960 or args.spellId == 59835 then
		warningNova:Show()
	end
end