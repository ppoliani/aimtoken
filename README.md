# Activity Interchange Mine

ERC20 contract for AIM Token.

Based on https://github.com/ConsenSys/Tokens/tree/master/contracts/eip20

## Features added to standard ERC20

### Lock-Up

The AIM Tokens attributed to the founders, advisors of the ICO will be blocked in the following conditions so that they will not be in a position to use or exchange their AIM Tokens just following the end of the ICO.

* Founders: blocked for 6 months
* Team: blocked for 6 months
* Advisors: progressively released during 1st year, 1/12 per month.


### AIM 2-Year Holding Bonus

Every 6 months during 2 years (4 times), 5% of additional AIM Tokens will be distributed, proportionally, only to the Users whose AIM Tokens bought in the pre-sale will never have been moved from their initial address.

## Test coverage

### Prepare environment:

1. Download and install [Ganache](http://truffleframework.com/docs/ganache/using) (GUI version strictly)
2. Install truffle `npm install truffle -g`
3. Run Ganache
4. Clone this repo and `npm install`

### Usage

Important! Please run tests separately. Like

`truffle test --network ganache test/distributeHolderBonus.test.js`

This is because a lot of test cases included business logic tightly connected with time in future. We can increase time in blockchain by `evm_increaseTime`, but cannot decrease. So please restart Ganache before test running (until the run test script is ready).
