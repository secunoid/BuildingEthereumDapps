pragma solidity ^0.4.18;
import "./Listing7_B_TranchePricingCrowdsale_forCapped.sol";
 
contract CappedTranchePricingCrowdsale is TranchePricingCrowdsale {
    uint256 fundingCap;//
 
    function CappedTranchePricingCrowdsale(uint256 _startTime,
        uint256 _endTime, uint256 _etherInvestmentObjective,
        uint256 _fundingCap)
      TranchePricingCrowdsale(_startTime, _endTime,     _etherInvestmentObjective) payable public
    {
        require(_fundingCap > 0);
        fundingCap = _fundingCap;
    }
    
    function isFullInvestmentWithinLimit(uint256 _investment)
        internal view returns (bool) {
        bool check = investmentReceived + _investment < fundingCap; //
        return check;
    }
}