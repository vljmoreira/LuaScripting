-- game table
-- coins the amount of coins
-- cash the amount of cash
-- cue, the cue he has

wallet = {
	coins=200,
	cash=10,
	cue="beginner"
} 




function checkAmountCoinsEqual(coins,value)
	if(coins == value) then
		return true
	else
		return false 
	end 
end

-- enterTier --
-- actions: enter a tier given its number
-- inputs: tier_name <number>
-- return: none 
function enterTier(tier_number)
end

-- clickButton --
-- actions: click a button given its name
-- inputs: button_name <string>
-- return: none 
function clickButton(button_name)
end

-- enterMatch --
-- actions: Enter a match
-- inputs: none
-- return: none 
function enterMatch()
end

-- winCurrentMatch --
-- Win the current match
-- inputs: none
-- return: none 
function winCurrentMatch()
end
-- loseCurrentMatch --
-- Lose the current match
-- inputs: none
-- return: none 
function loseCurrentMatch()
end

function payCoins(currentCoins,coins)

	if (currentCoins>=coins) then
		return currentCoins - coins
	else 
		return "Not enough money"
	end
end

function winCoins(currentCoins,coins)
	return currentCoins+coins
end

function myErrorHandler(err)
	print ("Error: ", err)
end


-- Test Script 1 -----
-- The player clicks in the “Play 1 v 1” button to enter that menu 
-- The player enters the “London” tier (tier number 1) 
-- By entering the London tier, the user pays 50 coins 


function script_1(coins)

enterMatch()
print ("clicou no botao:", clickButton("Play 1 v 1"))
print ("Entrou na tier 1:", enterTier(1))
wallet.coins = payCoins(wallet.coins,50)

print ("player has ", wallet.coins)
end

-- script_1(coins)
-- print("out of scope coins", coins)

-- Test Script 2 --
-- Create a test script which checks that if a player 
-- wins a match he/she  receives 200 coins
-- and if he/she loses he receives nothing 

function script_2(coins)

enterMatch()

 if (winCurrentMatch() == true) then
 	--receives coins
	 wallet.coins=winCoins(wallet.coins,200)
	-- check if value was added to the wallet
 elseif(loseCurrentMatch() == true) then
 	wallet.coins=wallet.coins
 end

end

--script_2(coins)

--Test Script 3
-- Imagine we have a cue named “Standard” which costs 5 Cash available  in the game’s shop. 
-- Create a test script to assure its purchase is working, 
-- knowing that the user needs to go to the shop by clicking the  button named “Shop” and once there,
-- needs to click on the button  “buy_standard_cue”

-- get current cash value before purchase
currentCash=wallet.cash
currentCue=wallet.cue
newCue="Standard"

if(newCue==currentCue) then
	print("Alteraton not done")
else 
	print("oki")
end



-- Click button Shop
if (clickButton("Shop")) then
	--Click button buy_standard_cue
	if (clickButton("buy_standard_cue"))then
		-- check if the purchase is working
		-- purchase is working if there's less 5 cash in the wallet
		-- cue value in wallet is Standard
		local purchasedCash = wallet.cash-5

		if (checkAmountCoinsEqual(currentCash,purchasedCash)==false) then
			-- check cue on the wallet
			-- considering that wallet.cue will have only one value at the time, if it had more I need to interate over the cue values.
			wallet.cue="Standard"

		end
	else
		print("Error click Button buy_standard_cue")
	end
else
	print("Error click Button Shop")
end


