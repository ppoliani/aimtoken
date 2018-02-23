pragma solidity ^0.4.18;

import "./Ownable.sol";

contract AIMBase is Ownable {

    // Initial amount received from the pre-sale
    mapping (address => uint256) public allocations;
    // False if part of the allocated amount is spent
    mapping (address => bool) public eligibleForBonus;
    // List of founders addresses
    mapping (address => bool) public founders;
    // List of advisors addresses
    mapping (address => bool) public advisors;
    // List of advisors team
    mapping (address => bool) public team;


    // 30 - 2592000
    // 31 - 2678400
    // Release dates for advisors: one twelfth released each month starting May 1st 2018 (midnight)
    uint256[12] ADVISORS_LOCK_DATES = [1525125600, // May 1st 2018 12:00:00 AM
                                       1527804000, // June 1st 2018 12:00:00 AM
                                       1530396000, // July 1st 2018 12:00:00 AM
                                       1533074400, // August 1st 2018 12:00:00 AM
                                       1535752800, // September 1st 2018 12:00:00 AM
                                       1538344800, // October 1st 2018 12:00:00 AM
                                       1541026800, // November 1st 2018 12:00:00 AM
                                       1543618800, // December 1st 2018 12:00:00 AM
                                       1546297200, // January 1st 2019 12:00:00 AM
                                       1548975600, // February 1st 2019 12:00:00 AM
                                       1551394800, // March 1st 2019 12:00:00 AM
                                       1554069600  // April 1st 2019 12:00:00 AM
                                    ];
    // Release date for founders and team members - 6 months after ICO
    uint256 FOUNDERS_TEAM_LOCK_DATE = 1541026800; // November 1st 2018 12:00:00 AM
    
    /// @param _address The address from which the locked amount will be retrieved
    /// @return The amount locked for _address.
    function getLockedAmount(address _address) internal view returns (uint256 lockedAmount) {
        // Only founders and advisors have locks
        if (!advisors[_address] && !founders[_address] && !team[_address]) return 0;
        // Determine release dates
        // If that's the advisory part, it's treated much more complex than the rest of the parties
        if (advisors[_address]) {

            uint256[12] memory lockDates = ADVISORS_LOCK_DATES;
            // Determine how many twelfths are locked
            for (uint8 i = 11; i >= 0; i--) {
                if (now >= lockDates[i]) {
                    return (allocations[_address] / 12) * (11 - i);
                }
            }            
        } else if (now < FOUNDERS_TEAM_LOCK_DATE) {
            // For all others - it's quite straightforward - we give everything the moment, the thresholder date passes
            return 0;
        }
        return allocations[_address];
    }

}
