-- game table
-- coins the amount of coins
-- cash the amount of cash
-- cue, the cue he has

wallet = {
	coins=200,
	cash=10,
	cue="beginner"
} 




function checkAmountMoneyEqual(coins,value)
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

	-- Click button Shop
	-- If the button wasn't clicked raise error
	assert(clickButton("Play 1 v 1"), "FAILED: couldn't click Play 1 v 1")
	-- Enter Tier London,it something went wrong raise and error
	assert(enterTier(1), "FAILED: couldn't enter Tier London")

	-- know the value of player cash after entering the tier
	-- should have less 50 coins from player wallet for entering the tier
	coinsAfterPay = payCoins(wallet.coins,50)

	-- verify the value on the wallet before enter tier with value after enter the tier 
	if(checkAmountMoneyEqual(wallet.coins,coinsAfterPay)==true) then
		print("Test FAILED: payment from entering London Tier not deducted")
	else 
		print("Test PASSED: Enter London tier and payed 50 coins")
	end
	end

-- Test Script 2 --
-- Create a test script which checks that if a player 
-- wins a match he/she  receives 200 coins
-- and if he/she loses he receives nothing 

function script_2(coins)

enterMatch()
initialCoins= wallet.coins

--if (winCurrentMatch()) then
	-- Check if the player received the money
	if(checkAmountMoneyEqual(wallet.coins,winCoins(initialCoins,200))==true) then
		print("Error: payment not received")
		check_1=0
	else 
		print("payment received")
		check_1=1
	end

	-- elseif(loseCurrentMatch()) then
		-- Coins in the wallet should be equal to the initial value
		if(checkAmountMoneyEqual(wallet.coins,initialCoins)==true) then
			print("Player lost the game, didn't receive money")
			check_2=1
		else 
			print("Error: Player lost the game but deducted money")
			check_2=0
		end
		-- end
		if (check_1==1 and check_2==1) then
			print("PASSED: Win and lose game are working")
		elseif (check_1 ~= 1) then
			print ("FAILED: Win game playment not working")
		elseif (check_2 ~= 1) then
			print("FAILED: Lose game not working")
		end
	end

--Test Script 3
-- Imagine we have a cue named “Standard” which costs 5 Cash available  in the game’s shop. 
-- Create a test script to assure its purchase is working, 
-- knowing that the user needs to go to the shop by clicking the  button named “Shop” and once there,
-- needs to click on the button  “buy_standard_cue”

-- get current cash value before purchase
currentCash=wallet.cash
currentCue=wallet.cue

-- Click button Shop
-- If the button wasn't clicked raise error, if it's a need to handle errors maybe use pcall or xpcall ?
assert(clickButton("Shop"), "FAILED: couldn't click button_Shop")
--Click button buy_standard_cue
-- If the button wasn't clicked raise error
assert(clickButton("buy_standard_cue"), "FAILED: couldn't click buy_standard_cue")

-- check if the purchase is working
-- purchase is working if there's less 5 cash in the wallet
-- and the cue value in wallet is set to Standard
local purchasedCash = wallet.cash-5
local newStandardCue="Standard"

if ((currentCash-purchasedCash) == 5) then
-- check cue on the wallet
-- considering that wallet.cue will have only one value at the time, if it had more I need to interate over the cue values.
	if( wallet.cue==newStandardCue) then
		print("PASSED: The Standard cue was bought by the player")
	else
		print ("FAILED: Cue Standard not bought ")
	end
end







