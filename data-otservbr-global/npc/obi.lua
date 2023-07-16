local internalNpcName = "Obi"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 19,
	lookBody = 63,
	lookLegs = 96,
	lookFeet = 38,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = 'Apenas ferro e madeira de qualidade usados para minhas armas!' },
	{ text = 'Compre suas armas aqui!' },
	{ text = 'Vendendo e comprando todos os tipos de armas, venha dar uma olhada!' },
	{ text = 'Pode dar uma bela surra naqueles monstros com minhas armas!' }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end


-- Basic keywords
keywordHandler:addKeyword({'hint'}, StdModule.rookgaardHints, {npcHandler = npcHandler})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'Bem, como posso ajuda-lo? Voce precisa de algumas {hints} gerais? Ou, se voce estiver interessado em um {trade}, basta perguntar.'})
keywordHandler:addKeyword({'information'}, StdModule.say, {npcHandler = npcHandler, text = 'Que tipo de informacao voce precisa? Eu poderia falar sobre diferentes topicos como {equipment}, {monsters} ou {Rookgaard} em geral.'})
keywordHandler:addKeyword({'torch'}, StdModule.say, {npcHandler = npcHandler, text = '{Al Dee} vende tochas.'})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, text = 'Cuidado la embaixo! Certifique-se de comprar {torches} suficientes e uma {rope} ou voce pode se perder.'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = 'O rei encorajou os vendedores a viajarem para ca, mas eu ousei correr o risco, e foi um risco!'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = 'Sim, |TIME|. Sinto muito, mas nao tenho relogios a venda.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu sou Obi, apenas Obi, o comerciante honesto. Se voce gosta de {trade}, basta perguntar.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu sou um comerciante e o ferreiro {weapon} local. Se voce gosta de ver meus produtos de qualidade ou vender armas para mim, peca-me um {trade}.'})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, text = 'Como aventureiro, voce sempre deve ter pelo menos uma {backpack}, uma {rope}, uma {shovel}, uma {weapon}, uma {armor} e um {shield}.'})
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, text = 'Se eu fosse voce, investiria meu dinheiro em aco e ferro de qualidade em vez de coloca-lo em uma conta bancaria chamada de cofre!'})
keywordHandler:addKeyword({'mainland'}, StdModule.say, {npcHandler = npcHandler, text = 'Bem, o continente tambem consiste em varios continentes. Mas nao temos contato nenhum com eles.'})
keywordHandler:addKeyword({'rookgaard'}, StdModule.say, {npcHandler = npcHandler, text = 'Ah, Rookgaard. Lar doce lar, foi isso que se tornou para mim, mas sempre sentirei falta de {Thais} e {Sam}'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'Oh, Thais, eu voltarei. Um dia, eu estarei de volta.'})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, text = 'Meu bom e velho primo Sam. Oh, como eu sinto falta dele.'})
keywordHandler:addKeyword({'academy'}, StdModule.say, {npcHandler = npcHandler, text = 'Acho que uma boa pratica e melhor do que ler um livro chato. Claro, voce precisara de {equipment} adequado para poder praticar!'})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = 'Disse-lhes para me deixarem vender comida, mas nao! Desculpe, voce tem que perguntar a {Willie} ou {Billy} nas fazendas a oeste daqui.'})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, text = 'Bons monstros para comecar sao ratos. Eles vivem nos {sewers} sob a vila de {Rookgaard}.'})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, text = 'Existem muitas entradas de esgoto em Rookgaard. Um fica do lado de fora desta loja e a esquerda. Para mais detalhes sobre monstros e masmorras, fale com um dos {guards}.'})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, text = 'O guarda da ponte {Dallheim} fica ao norte daqui, apenas siga a rua, voce nao pode errar.'})
keywordHandler:addKeyword({'merchant'}, StdModule.say, {npcHandler = npcHandler, text = 'Infelizmente, poucos comerciantes sao tao honestos quanto eu.'})
keywordHandler:addKeyword({'potion'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu gostaria de poder ajuda-lo com isso, mas nao, me disseram para ficar com as armas. Va ver {Lily}.'})
keywordHandler:addKeyword({'blueberr'}, StdModule.say, {npcHandler = npcHandler, text = 'Ha muitos arbustos de mirtilo dentro e ao redor desta vila. A natureza sem foi de graca.'})
keywordHandler:addKeyword({'how', 'are', 'you'}, StdModule.say, {npcHandler = npcHandler, text = 'Estou bem. Esta um pouco quente perto do cadinho, mas eu gosto do som de forjar {weapons}.'})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, text = 'Basta me pedir um {trade} para ver quais coisas eu compro de voce.'})

keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, text = 'Oh, aqui em cima. Minha neta {Dixi} esta encarregada de vender armaduras e escudos.'})
keywordHandler:addAliasKeyword({'shield'})
keywordHandler:addAliasKeyword({'helmet'})

keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, text = 'Sim, estou vendendo armas. Basta me pedir um {trade} para ver minhas ofertas e as coisas que compro.'})

keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, text = 'Bem, sem ouro, sem acordo. Ganhe ouro lutando contra {monsters} e pegando as coisas que eles carregam. Venda para {merchants} para obter lucro!'})
keywordHandler:addAliasKeyword({'money'})

keywordHandler:addKeyword({'rope'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu gostaria de poder te ajudar, mas eu apenas vendo armas. Vai ver {Al Dee} ou {Lee\'Delle}.'})
keywordHandler:addAliasKeyword({'shovel'})
keywordHandler:addAliasKeyword({'backpack'})
keywordHandler:addAliasKeyword({'fishing'})

keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu vendo {weapons} de todos os tipos. Apenas me fale {trade} se quiser ver minhas ofertas.'})
keywordHandler:addAliasKeyword({'stuff'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})

-- Names
keywordHandler:addKeyword({'norma'}, StdModule.say, {npcHandler = npcHandler, text = 'Nao sei como alguem poderia desistir do prospero negocio que ela liderava. Ela deveria ter me escutado e encontrado alguem que continue esse negocio para ela.'})
keywordHandler:addKeyword({'loui'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu disse a ele que nao havia perigo, mas ele nao quis me ouvir, ninguem me ouve.'})
keywordHandler:addKeyword({'santiago'}, StdModule.say, {npcHandler = npcHandler, text = 'Sugeri a ele abrir uma empresa de guias turisticos comigo, Obi\'s and Santiago\'s, mas ele nao aprovou. Eu realmente nao entendo o porque.'})
keywordHandler:addKeyword({'zirella'}, StdModule.say, {npcHandler = npcHandler, text = 'Uma velha nao deveria ser tratada assim, de jeito nenhum, ruim isso...'})
keywordHandler:addKeyword({'al', 'dee'}, StdModule.say, {npcHandler = npcHandler, text = 'Oh, esse cara esta muito ganancioso, muito ganancioso. Roubando pobres aventureiros como voce!'})
keywordHandler:addKeyword({'amber'}, StdModule.say, {npcHandler = npcHandler, text = 'Ow, linda, muito, muito linda. Espero poder impressiona-la de alguma forma.'})
keywordHandler:addKeyword({'billy'}, StdModule.say, {npcHandler = npcHandler, text = 'Ele parece como seu primo {Willie}.'})
keywordHandler:addKeyword({'willie'}, StdModule.say, {npcHandler = npcHandler, text = 'Esse cara nao entende que deveria me confiar o negocio de alimentos tambem. Ele realmente deveria fazer. Entao ele teve tempo para sua fazenda.'})
keywordHandler:addKeyword({'cipfried'}, StdModule.say, {npcHandler = npcHandler, text = 'Ele nao deveria curar as pessoas de sem cobrar nada, jamais, ele nao deveria. Isso seria uma grande fonte de renda para a vila que poderia ser investida no aprimoramento da ferraria.'})
keywordHandler:addKeyword({'dixi'}, StdModule.say, {npcHandler = npcHandler, text = 'Oh, que garotinha cativante, e ela esta trabalhando tanto para me ajudar, mesmo sem receber pagamento. Uma menina tao doce!'})
keywordHandler:addKeyword({'hyacinth'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu nao gosto dele, na verdade eu nao gosto dele profundamente. Ele e muito ganancioso que nao quer dividir o lucro que obtem com as pocoes de saude.'})
keywordHandler:addKeyword({'lee\'delle'}, StdModule.say, {npcHandler = npcHandler, text = 'Ela arruina o mercado com suas ofertas! Isso e ruim para os comerciantes honestos, muito ruim.'})
keywordHandler:addKeyword({'lily'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu sabia! Eu sabia que ela tentaria obter o monopolio das pocoes nesta vila! Mas ninguem me ouviu!'})
keywordHandler:addKeyword({'oracle'}, StdModule.say, {npcHandler = npcHandler, text = 'O oraculo, ah, que ser estranho! Isso o levara para fora desta ilha quando voce estiver no nivel 8, sim, vai, marque minhas palavras.'})
keywordHandler:addKeyword({'paulie'}, StdModule.say, {npcHandler = npcHandler, text = 'Eu disse a todos que ele vai causar problemas. Ele convence as pessoas a darem dinheiro a ele e coloca-lo no {bank}! Eles deveriam deixa-lo aqui conosco, comerciantes honestos!'})
keywordHandler:addKeyword({'seymour'}, StdModule.say, {npcHandler = npcHandler, text = 'Ele e o chefe da academia local. Eu o encorajei a patrocinar voce, mas ninguem ouve Obi, ninguem me ouve, como sempre.'})
keywordHandler:addKeyword({'tom'}, StdModule.say, {npcHandler = npcHandler, text = 'Bem, ele so compra o que ninguem mais quer. Coisas que estao mortas ha muito tempo. Eu posso viver com isso, sim, eu posso viver com isso.'})
keywordHandler:addKeyword({'dallheim'}, StdModule.say, {npcHandler = npcHandler, text = 'Que heroi, que heroi.'})
keywordHandler:addAliasKeyword({'zerbrus'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Hum sim, bom dia.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Adeus, espero que tenha ficado satisfeito com nosso trabalho.')
npcHandler:setMessage(MESSAGE_SENDTRADE, 'Claro, apenas navegue pelos meus produtos.')
npcHandler:setMessage(MESSAGE_GREET, 'Ola, Ola, |PLAYERNAME|! Entre, olhe e compre! Se voce gosta de ver minhas ofertas, pode pedir uma')

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "small stone", clientId = 1781, buy = 5 },
	{ itemName = "spear", clientId = 3277, buy = 10 },
	{ itemName = "arrow", clientId = 3447, buy = 2 },
	{ itemName = "bolt", clientId = 3446, buy = 2 },
    { itemName = "machete", clientId = 3308, buy = 100, sell = 3 },
	{ itemName = "hand axe", clientId = 3268, buy = 100, sell = 4 },
	{ itemName = "studded club", clientId = 3336, buy = 100, sell = 4 },
    { itemName = "rapier", clientId = 3272, sell = 25 },
	{ itemName = "sabre", clientId = 3273, sell = 25 },
	{ itemName = "axe", clientId = 3274, sell = 25 },
	{ itemName = "bone club", clientId = 3337, sell = 25 },
	{ itemName = "sword", clientId = 3264, sell = 25 },
	{ itemName = "carlin sword", clientId = 3283, sell = 25 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "light mace", clientId = 3325, sell = 25 },
	{ itemName = "katana", clientId = 3300, sell = 25 },
	{ itemName = "daramian axe", clientId = 3329, sell = 25 },
	{ itemName = "mace", clientId = 3286, sell = 25 },
	{ itemName = "long sword", clientId = 3285, sell = 25 },
	{ itemName = "knight axe", clientId = 3318, sell = 25 },
	{ itemName = "iron hammer", clientId = 3310, sell = 25 },
	{ itemName = "poison dagger", clientId = 3299, sell = 25 },
	{ itemName = "scythe of the reaper", clientId = 9384, sell = 25 },
	{ itemName = "swampling club", clientId = 17824, sell = 25 },
	{ itemName = "scimitar", clientId = 3307, sell = 25 },
	{ itemName = "throwing axe", clientId = 35515, sell = 25 },
	{ itemName = "diamond sceptre", clientId = 7387, sell = 25 },
	{ itemName = "bow", clientId = 3350, sell = 25 },
	{ itemName = "elvish bow", clientId = 7438, sell = 25 },
	{ itemName = "living vine bow", clientId = 29417, sell = 25 },
	{ itemName = "crossbow", clientId = 3349, sell = 25 },
	{ itemName = "modified crossbow", clientId = 7438, sell = 25 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
