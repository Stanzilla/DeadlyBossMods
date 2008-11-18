local mod = DBM:NewMod("MageLordUrom", "DBM-Party-WotLK", 9)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(27655)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)

local warningTimeBomb		= mod:NewAnnounce("WarningTimeBomb", 3, 51121)
local warningExplosion		= mod:NewAnnounce("WarningExplosion", 3, 51110)

local timerTimeBomb		= mod:NewTimer(6, "TimerTimeBomb", 51121)
local timerExplosion		= mod:NewTimer(8, "TimerExplosion", 51110)

local specWarnBombYou		= mod:NewSpecialWarning("SpecWarnBombYou", nil, false, true)

function mod:SPELL_CAST_START(args)
	if args.spellId == 51110 then
		warningExplosion:Show();
		timerExplosion:Start();
		if args.destName == UnitName("player") then
			specWarnBombYou:Show()
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 51121 then
		warningTimeBomb:Show(args.destName);
		timerTimeBomb:Start(args.destName);
	end
end