# Activity Interchange Mine

ERC20 contract for AIM Token.

Based on https://github.com/ConsenSys/Tokens/tree/master/contracts/eip20

## Features added to standard ERC20

### Lock-Up

The AIM Tokens attributed to the founders, advisors of the ICO will be blocked in the following conditions so that they will not be in a position to use or exchange their AIM Tokens just following the end of the ICO.

* Founders: blocked for 6 months
* Advisors: progressively released during 1st year, 1/12 per month.

### AIM Pre-Sale Bonus

All pre-sales are attributed with additional bonus AIM Tokens based on amount bought

* €500,000 (3,333,333 AIM) - €999,999 (6,666,665 AIM): 10% bonus
* €1,000,000 (6,666,666 AIM) - €2,499,999 (16,666,665 AIM): 15% bonus
* €2,500,000 (16,666,666 AIM) - €4,999,999 (33,333,332 AIM): 20% bonus
* €5,000,000 (33,333,333 AIM) - €7,499,999 (49,999,999 AIM): 25% bonus
* From €7,500,000 (50,000,000 AIM): 30% bonus

### AIM 6-months Holding Bonus

Only half of all additional bonuses aquired during sale are available straight away. All Users whose AIM Tokens were never moved from their initial address will receive the rest of the bonus after 6 months.

<!-- ## Test coverage

### Prepare environment:

1. Download and install [Ganache](http://truffleframework.com/docs/ganache/using) (GUI version strictly)
2. Install truffle `npm install truffle -g`
3. Run Ganache
4. Clone this repo and `npm install`

### Usage

Important! Please run tests separately. Like

`truffle test --network ganache test/distributeHolderBonus.test.js`

This is because a lot of test cases included business logic tightly connected with time in future. We can increase time in blockchain by `evm_increaseTime`, but cannot decrease. So please restart Ganache before test running (until the run test script is ready).
-->