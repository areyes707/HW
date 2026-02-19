-- HW: Welcome to the Number Guessing Game in Lua
-- Name: Alize Reyes
-- Script: Number Guessing Game
-- Description: A number guessing game where the player has to guess a randomly generated number between 1 and 100 within limited attempts.

math.randomseed(os.time()) -- randomizes the number each time the game is ran
local playAgain = true -- controls whether the game repeats or not

while playAgain do
	local secret = math.random(1, 100) -- generates a random number between 1 and 100
	local attempts = 7 -- number of attempts the player has to guess the number
	print("\nI'm thinking of a number between 1 and 100.")

	while attempts > 0 do
		print("Attempts left: " .. attempts)
		io.write("Enter your guess: ")
		local input = io.read() -- reads the player's guess
		local guess = tonumber(input)

		if not guess then
			print("Error please be sure to enter a number!") -- error handling for letters
		else
			if guess == secret then
				print("Winner. You got it!")
				break
			elseif guess < secret then
				print("Too low...")
				attempts = attempts - 1
			else
				print("Too high!")
				attempts = attempts - 1
			end
		end
	end

	if attempts == 0 then
		print("\nSorry you lose! The number was " .. secret) -- reveals the number
	end

	io.write("\nWould you like to play again? (yes!/no ty.): ")
	local answer = (io.read() or ""):lower()
	if answer == "no ty." then
		playAgain = false -- stops the loop
		print("Maybe next time!")
	else
		playAgain = true -- starts a new round
	end
end
