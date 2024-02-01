
-- CREDIT TO https://www.reddit.com/r/pokemonrng/comments/172n3ec/pokemon_gen3_lua_script_for_mgba/ for most of the
-- boilerplate code required for this.
--
-- Let's get scripting! :9
--                                       ░░░░  ░░░░                              
--                                     ░░████░░▓▓▒▒░░                            
--                                     ██▓▓██▓▓▓▓░░▒▒░░                          
--                                     ██▓▓██▓▓▓▓░░▒▒░░                          
--                                   ██▓▓▓▓████▒▒▒▒░░▒▒                          
--                                 ██▓▓▓▓██▓▓▓▓▓▓▒▒░░▒▒▓▓                        
--                               ██▓▓▓▓██▓▓▓▓██▓▓▓▓░░▒▒░░░░░░░░                  
--                           ████▓▓▓▓██▓▓▓▓▒▒██▓▓▒▒░░▒▒▓▓▓▓▓▓                    
--                         ▓▓██░░▓▓██▓▓▓▓▓▓▓▓██▓▓▓▓░░▒▒▒▒▓▓▒▒  ░░                
--                       ██████████▒▒▓▓▓▓▓▓██▓▓▓▓▓▓░░▒▒▓▓░░▓▓▓▓                  
--                     ██████░░████▓▓▓▓▓▓████▓▓▓▓░░▒▒▓▓▓▓▓▓▓▓▒▒░░  ░░            
--             ████████▓▓▓▓██  ████▓▓▒▒▒▒██▓▓▓▓▒▒░░▒▒▓▓▒▒▒▒▓▓▓▓▓▓░░              
--           ▓▓████▓▓▓▓▓▓▓▓▓▓  ████▓▓▓▓▒▒██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒    ░░          
--           ████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▓▓████▓▓▒▒▒▒▓▓▒▒▓▓▓▓░░▓▓░░            
--             ████▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓▓▓░░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒              
--               ██████████▓▓▓▓▓▓▒▒▓▓▒▒▒▒▒▒▓▓▓▓░░░░▓▓▒▒▒▒▒▒▒▒▓▓▓▓░░              
--               ░░████▓▓▓▓▓▓▓▓▓▓▒▒▓▓▒▒▒▒▓▓░░▒▒░░▒▒▒▒▓▓▒▒▒▒▓▓▒▒▓▓░░▒▒░░          
--                   ░░████▓▓▓▓▒▒▓▓▓▓▓▓▓▓▒▒░░░░░░▒▒░░▒▒▒▒▓▓▒▒▓▓▓▓▓▓░░            
--                         ░░▓▓▓▓▓▓▒▒▒▒░░░░░░░░▒▒░░░░▒▒▒▒▓▓▒▒▓▓▒▒▓▓              
--                               ░░▒▒░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓              
--                                   ▒▒░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓              
--                                     ▒▒▒▒░░░░░░▒▒▒▒▒▒▓▓▒▒▒▒▓▓▓▓▓▓              
--                                     ▓▓▓▓▒▒░░░░▒▒▒▒▒▒▓▓▒▒▓▓▓▓▓▓▓▓░░            
--                                     ▓▓▒▒▒▒▒▒░░▒▒▒▒▒▒▓▓▒▒▓▓▓▓▓▓▓▓▓▓            
--                                   ░░▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▓▓▒▒▓▓░░          
--                                   ▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▓▓▓▓▓▓          
--                                 ░░▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▓▓▓▓▓▓          
--                                 ▓▓▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▓▓▒▒▓▓▒▒▓▓▓▓▓▓▓▓          
--                                 ▓▓▒▒▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓          
--                                 ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓          
--                                 ▓▓▓▓▓▓▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒▒▓▓          
--                                 ▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▓▓▓▓▓▓          
--                                 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▓▓░░          
--                               ░░▓▓▒▒▓▓▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▓▓            
--                             ░░░░▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▓▓░░          
--             ░░    ░░▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▓▓▒▒░░░░        
--           ░░██  ░░▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░    
--         ░░████  ░░▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓░░  
--       ░░▓▓▓▓██  ░░▓▓▒▒▓▓▓▓▒▒▓▓▓▓▒▒▓▓▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▓▓▒▒▒▒▓▓▓▓▓▓▒▒▓▓░░
--       ░░██▓▓██░░  ▓▓▒▒▓▓▓▓▓▓▒▒▒▒▒▒██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▓▓▓▓▒▒▓▓░░
--     ░░████▓▓▓▓██  ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██▒▒▒▒▒▒▓▓▓▓▒▒▓▓▓▓  
--   ░░██▓▓██▓▓▓▓██  ░░▓▓▒▒▓▓▒▒▒▒▒▒▒▒██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒██▓▓▓▓██▒▒▒▒▒▒▒▒▓▓▒▒▓▓    
--   ░░██▓▓██▓▓▓▓████  ░░▓▓▒▒▓▓▒▒▒▒▒▒██▓▓▓▓▒▒▓▓▒▒▒▒▒▒██▒▒▓▓▓▓██▒▒▒▒▒▒▒▒▒▒▓▓▓▓    
--   ░░██▓▓██▓▓▓▓████░░  ░░▓▓▒▒▓▓▒▒▒▒▒▒██▓▓▓▓██▒▒▒▒▒▒██▓▓▓▓██▒▒▒▒▒▒▒▒▒▒▒▒▓▓░░    
--     ░░██▓▓██▓▓██▓▓██░░░░░░▓▓▓▓▓▓▒▒▒▒██▓▓▓▓██▒▒▒▒▒▒██▓▓▓▓██▒▒▒▒▓▓▒▒▓▓▓▓░░      
--     ░░██▓▓▓▓▓▓██▓▓████████████▒▒▒▒▒▒██▓▓▓▓██▒▒▒▒██▓▓▓▓██▒▒▓▓▓▓▓▓▓▓░░░░        
--       ░░██▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▒▒▒▒████████▓▓▓▓██████▓▓▓▓▓▓████████░░        
--         ░░████▓▓▓▓▓▓▓▓██▒▒▒▒▒▒▓▓██████▓▓▒▒▒▒████▒▒▒▒▓▓████████▒▒▒▒▒▒██░░      
--           ░░██████████▒▒▓▓██▓▓▓▓▓▓██▓▓██▒▒██▓▓████▒▒██▓▓██▓▓▓▓▓▓▓▓██▒▒██      
--             ░░░░░░░░░░████████████████████████████████████████████████░░░░    

-- #############################################################################################
-- # Main Game Context Object, really just doing a buncha things in this to make things easier #
-- #############################################################################################
Game = {}

function Game:new(o, name, data)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.name = name
    self.data = data
    return o
end

-- Converts raw bytes into a readable string
function bytesToString(game, rawString)
    local string = ""
    for _, char in ipairs({rawString:byte(1, #rawString)}) do
        if char == 0xFF then
            break
        end

        string = string..game.data.charmap[char]
    end
    return string
end

-- Get species name from <game> and pokemon <id>
function getSpeciesName(game, id)
    local pointer = game.data.speciesNameTable + 11 * id
    return bytesToString(game, emu.memory.cart0:readRange(pointer, 10))
end

function getSpeciesData(game, id)
    local species_data = {}
    local pointer = game.data.speciesDataTable + 28 * id
    species_data.gender_threshold = emu.memory.cart0:read8(pointer + 16)
    return species_data
end

function getMonGender(game, species_id, gender)
    if gender == 0 then return "Male" end
    if gender == 254 then return "Female" end
    if gender == 255 then return "Unknown" end
    
    -- Otherwise, we compare against the provided species' gender threshold value
    local species_data = getSpeciesData(game, species_id)
    if species_data.gender_threshold <= gender then return "Male"
    else return "Female" end
end

-- Context Readers: Making this stuff modular so that others can add their own context later on if they
-- feel like it I suppose.
ContextGetter = {}

function ContextGetter:new(o, game)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.game = game
    return o
end

-- This is the function that should be overridden when creating a new context getter.
function ContextGetter:getContextString()
    return ""
end

-- ContextGetter implementation example
MonPartyContextGetter = {}
function MonPartyContextGetter:new(o, game)
    o = o or ContextGetter:new(o, game)
    setmetatable(o, self)
    self.__index = self
    self.game = game
    return o
end

function MonPartyContextGetter:getContextString()
    
    local party_count = emu:read8(self.game.data.partyCount)

    local result_string = string.format("The trainer's party currently contains %d Pokemon: ", party_count)
    for party_index = 1, party_count do
        local mon = self:_parseMonData(self.game.data.party + 100 * (party_index - 1))
        result_string = result_string .. self:getMonString(mon)
    end
    return result_string
end

function MonPartyContextGetter:getMonString(mon)
    return string.format("a level %d %s %s named %s, ",
        mon.level,
        mon.gender,
        mon.species,
        mon.nickname)
end

-- Eval stats
function MonPartyContextGetter:_parseMonData(address)
	local mon = {}
	--mon.status = emu:read32(address + 80)
	mon.level = emu:read8(address + 84)
	--mon.mail = emu:read32(address + 85)
	--mon.hp = emu:read16(address + 86)
	
	mon.STs = {
		emu:read16(address + 88),
		emu:read16(address + 90),
		emu:read16(address + 92),
		emu:read16(address + 96),
		emu:read16(address + 98),
		emu:read16(address + 94)
	}
	
	mon.personality = emu:read32(address + 0)
	mon.otId = emu:read32(address + 4)
	mon.nickname = bytesToString(self.game, emu:readRange(address + 8, 10))
	--mon.language = emu:read8(address + 18)
	mon.nature = mon.personality % 25
    mon.gender_num = mon.personality % 256
	--mon.otName = game:toString(emu:readRange(address + 20, 10))
	--mon.markings = emu:read8(address + 27)
	
	local flags = emu:read8(address + 19)
	--mon.isBadEgg = flags & 1
	--mon.hasSpecies = (flags >> 1) & 1
	--mon.isEgg = (flags >> 2) & 1
	
	local key = mon.otId ~ mon.personality
	mon.shi = math.floor(key/0x10000) ~ (key % 0x10000)
	local substructSelector = {
		[ 0] = {0, 1, 2, 3},
		[ 1] = {0, 1, 3, 2},
		[ 2] = {0, 2, 1, 3},
		[ 3] = {0, 3, 1, 2},
		[ 4] = {0, 2, 3, 1},
		[ 5] = {0, 3, 2, 1},
		[ 6] = {1, 0, 2, 3},
		[ 7] = {1, 0, 3, 2},
		[ 8] = {2, 0, 1, 3},
		[ 9] = {3, 0, 1, 2},
		[10] = {2, 0, 3, 1},
		[11] = {3, 0, 2, 1},
		[12] = {1, 2, 0, 3},
		[13] = {1, 3, 0, 2},
		[14] = {2, 1, 0, 3},
		[15] = {3, 1, 0, 2},
		[16] = {2, 3, 0, 1},
		[17] = {3, 2, 0, 1},
		[18] = {1, 2, 3, 0},
		[19] = {1, 3, 2, 0},
		[20] = {2, 1, 3, 0},
		[21] = {3, 1, 2, 0},
		[22] = {2, 3, 1, 0},
		[23] = {3, 2, 1, 0},
	}
	
	local pSel = substructSelector[mon.personality % 24]
	local ss0 = {}
	local ss1 = {}
	local ss2 = {}
	local ss3 = {}
	
	for i = 0, 2 do
		ss0[i] = emu:read32(address + 32 + pSel[1] * 12 + i * 4) ~ key
		ss1[i] = emu:read32(address + 32 + pSel[2] * 12 + i * 4) ~ key
		ss2[i] = emu:read32(address + 32 + pSel[3] * 12 + i * 4) ~ key
		ss3[i] = emu:read32(address + 32 + pSel[4] * 12 + i * 4) ~ key
	end
	
    mon.species_id = ss0[0] & 0xFFFF
	mon.species = getSpeciesName(self.game, mon.species_id)
    mon.gender = getMonGender(self.game, mon.species_id, mon.gender_num)
    
	--mon.heldItem = ss0[0] >> 16
	mon.experience = ss0[1]
	--mon.ppBonuses = ss0[2] & 0xFF
	--mon.friendship = (ss0[2] >> 8) & 0xFF
	
	mon.moves = {
		ss1[0] & 0xFFFF,
		ss1[0] >> 16,
		ss1[1] & 0xFFFF,
		ss1[1] >> 16
	}
	
	mon.pp = {
		ss1[2] & 0xFF,
		(ss1[2] >> 8) & 0xFF,
		(ss1[2] >> 16) & 0xFF,
		ss1[2] >> 24
	}
	
	mon.EVs = {
		ss2[0] & 0xFF,
		(ss2[0] >> 8) & 0xFF,
		(ss2[0] >> 16) & 0xFF,
		ss2[1] & 0xFF,
		(ss2[1] >> 8) & 0xFF,
		ss2[0] >> 24
	}
	
	--mon.cool = (ss2[1] >> 16) & 0xFF
	--mon.beauty = ss2[1] >> 24
	--mon.cute = ss2[2] & 0xFF
	--mon.smart = (ss2[2] >> 8) & 0xFF
	--mon.tough = (ss2[2] >> 16) & 0xFF
	--mon.sheen = ss2[2] >> 24
	
	--mon.pokerus = ss3[0] & 0xFF
	--mon.metLocation = (ss3[0] >> 8) & 0xFF
	
	flags = ss3[0] >> 16
	--mon.metLevel = flags & 0x7F
	--mon.metGame = (flags >> 7) & 0xF
	--mon.pokeball = (flags >> 11) & 0xF
	--mon.otGender = (flags >> 15) & 0x1
	
	flags = ss3[1]
	mon.IVs = {
		flags & 0x1F,
		(flags >> 5) & 0x1F,
		(flags >> 10) & 0x1F,
		(flags >> 20) & 0x1F,
		(flags >> 25) & 0x1F,
		(flags >> 15) & 0x1F,
	}
	
	-- Bit 30 is another "isEgg" bit
	--mon.altAbility = (flags >> 31) & 1
	
	--flags = ss3[2]
	--mon.coolRibbon = flags & 7
	--mon.beautyRibbon = (flags >> 3) & 7
	--mon.cuteRibbon = (flags >> 6) & 7
	--mon.smartRibbon = (flags >> 9) & 7
	--mon.toughRibbon = (flags >> 12) & 7
	--mon.championRibbon = (flags >> 15) & 1
	--mon.winningRibbon = (flags >> 16) & 1
	--mon.victoryRibbon = (flags >> 17) & 1
	--mon.artistRibbon = (flags >> 18) & 1
	--mon.effortRibbon = (flags >> 19) & 1
	--mon.marineRibbon = (flags >> 20) & 1
	--mon.landRibbon = (flags >> 21) & 1
	--mon.skyRibbon = (flags >> 22) & 1
	--mon.countryRibbon = (flags >> 23) & 1
	--mon.nationalRibbon = (flags >> 24) & 1
	--mon.earthRibbon = (flags >> 25) & 1
	--mon.worldRibbon = (flags >> 26) & 1
	--mon.eventLegal = (flags >> 27) & 0x1F
	return mon
end

-- Some important constant data
engCharmap = { [0]=
	" ", "À", "Á", "Â", "Ç", "È", "É", "Ê", "Ë", "Ì", "こ", "Î", "Ï", "Ò", "Ó", "Ô",
	"Œ", "Ù", "Ú", "Û", "Ñ", "ß", "à", "á", "ね", "ç", "è", "é", "ê", "ë", "ì", "ま",
	"î", "ï", "ò", "ó", "ô", "œ", "ù", "ú", "û", "ñ", "º", "ª", "�", "&", "+", "あ",
	"ぃ", "ぅ", "ぇ", "ぉ", "v", "=", "ょ", "が", "ぎ", "ぐ", "げ", "ご", "ざ", "じ", "ず", "ぜ",
	"ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",
	"っ", "¿", "¡", "P\u{200d}k", "M\u{200d}n", "P\u{200d}o", "K\u{200d}é", "�", "�", "�", "Í", "%", "(", ")", "セ", "ソ",
	"タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "â", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "í",
	"ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "⬆", "⬇", "⬅", "➡", "ヲ", "ン", "ァ",
	"ィ", "ゥ", "ェ", "ォ", "ャ", "ュ", "ョ", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ",
	"ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ",
	"ッ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?", ".", "-", "・",
	"…", "“", "”", "‘", "’", "♂", "♀", "$", ",", "×", "/", "A", "B", "C", "D", "E",
	"F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
	"V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
	"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "▶",
	":", "Ä", "Ö", "Ü", "ä", "ö", "ü", "⬆", "⬇", "⬅", "�", "�", "�", "�", "�", ""
}


-- ####################
-- # Game Definitions #
-- ####################

-- Fuck it, only doing Ruby for now cause I'm lazy :9
local gameRubyUS = Game:new(nil, "Ruby (USA)", {
    party=0x3004360,
    partyCount=0x3004350,
	speciesNameTable=0x1F716C,
    speciesDataTable=0x1FEC34,
    charmap=engCharmap,
})

-- ######################
-- # Emulator callbacks #
-- ######################
frame = 0
function updateBuffer()
    if not contextBuffer or not curGame then
        return
    end

    local partyContextGetter = MonPartyContextGetter:new(nil, curGame)
    -- Otherwise, we have both available and we're ready
    -- to read game data.
    if frame == 0 then
        contextBuffer:clear()
        contextBuffer:print(partyContextGetter:getContextString())
    else
        if frame == 240 then frame = 0 end
    end
    frame = frame + 1

end

function initScript()
    if not contextBuffer then
        contextBuffer = console:createBuffer("MonContext")
    end

    console:log("\nInitializing script.\n")

    curGame = gameRubyUS
    
end

callbacks:add("frame", updateBuffer)
callbacks:add("start", initScript)
callbacks:add("reset", initScript)

-- 
if emu then
    initScript()
end