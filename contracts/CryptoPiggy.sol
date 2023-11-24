/** Piggy Vest Functionality:
*
*   Wallet(changable, flawless),  
*
* Account - address:
*   Account struct -> address, saving, groups[id1, id2,..], 
*      savingPeriod, investedValue, investments[id1, id2,], circle[addresses]
*   
* 
* Transfer and Lock Funds for a period
*   Get token address and amount
*   approve contract as spender
*   send tokens to wallet
*   save data dnd time
* 
*
* Withdrawal:
* If before lock period: 1.5% charge - changable capped
*   charge = amount * 0.015
*   Use call => amount - charge
* If after lock period: 10% per annum - changable capped
*   amountPerDay = percentProfitPerDay * amount
*   profit = days passed * amountPerDay
*   Use call -> amount, mint(profit in native tokens)
*
*
* Investments Protocol (Profit must be between 10 - 20%) - (risk = +-profit):
* View Investment List with expected profit in % and duration
* link amount from savings(only) to and investment id
* Mint amount(in native tokens) to user as collateral
* Listen for timestamp > duration
* If investment works:
*   move (amount + profit) to user savings
* If investment fails:
*   move (amount - profit) to user savings 
* 
* 
* Socials - Saving Groups Protocol:
*   Savings Group Structure with id
*   Map id to address
*   Create group and set goal(amount) at once
*   public or circle
*   mint tokens to all participants if goal is reached
*
*
* Lending Protocol better than AAVE
* 
* 
*/


/** Native Crypto Piggy Functionality: 
* Accept Any ERC20 Token 
* Accept NFTs
* 
* Withdrawals:
* Reps Jar
* Monthly rewards
*
* Social:
*   Mint PIGGY token as you save
*   Optional: Governing System of voting
*   Optional: Fund me in circle
*
* Investments:
*
* Lending Protocol better than AAVE
*/

