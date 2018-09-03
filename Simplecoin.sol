event Refund(address investor, uint256 value);
 
function refund() public {
      if (!isRefundingAllowed) revert();//
 
      address investor = msg.sender;
      uint256 investment = investmentAmountOf[investor];
      if (investment == 0) revert();//
      investmentAmountOf[investor] = 0;//
      investmentRefunded += investment;
      Refund(msg.sender, investment);
 
      if (!investor.send(investment)) revert();//
}
//#A Only allow refunding is this has been allowed at the crowdsale finalization
//#B Only allow refunding if the investor has contributed a meaningful amount
//#C keep a record of all refunds
//#D Transfer ether back to the investor and handle possible transfer error