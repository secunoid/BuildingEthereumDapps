pragma solidity ^0.4.18;
import "./Listing6_5_SimpleCrowdsale.sol";
 
contract CappedCrowdsale is SimpleCrowdsale {
    uint256 fundingCap;//
 
    function CappedCrowdsale(uint256 _startTime, uint256 _endTime,
    uint256 _weiTokenPrice, uint256 _etherInvestmentObjective,
    uint256 _fundingCap)
    SimpleCrowdsale(_startTime, _endTime,
    _weiTokenPrice, _etherInvestmentObjective)//
      payable public
    {
        require(_fundingCap > 0);
        fundingCap = _fundingCap;
    }
    
    function isValidInvestment(uint256 _investment) //
        internal view returns (bool) {
        bool nonZeroInvestment = _investment != 0;//
        bool withinCrowsalePeriod = now >= startTime && now <= endTime; //
 
        bool isInvestmentBelowCap = investmentReceived + _investment < fundingCap; //
       
        return nonZeroInvestment && withinCrowsalePeriod && isInvestmentBelowCap;
    }
}