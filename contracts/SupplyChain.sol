/*
    This exercise has been updated to use Solidity version 0.5
    Breaking changes from 0.4 to 0.5 can be found here: 
    https://solidity.readthedocs.io/en/v0.5.0/050-breaking-changes.html
*/

pragma solidity ^0.5.0;

contract SupplyChain {

  /* set owner */
  address public owner  = msg.sender(address,payable);

  /* Add a variable called skuCount to track the most recent sku # */
  constructor() public {
  skuCount = msg.sender;
  }

  /* Add a line that creates a public mapping that maps the SKU (a number) to an Item.
     Call this mappings items
  */
  contract SKU{
     mapping (address => uint) public SKU(string);

  /* Add a line that creates an enum called State. This should have 4 states
    ForSale
    Sold
    Shipped
    Received
    (declaring them in this order is important for testing)
  */
public enum SKU {
    ForSale;
    Sold;
    Shipped;
    Received;
    }

  /* Create a struct named Item.
    Here, add a name, sku, price, state, seller, and buyer
    We've left you to figure out what the appropriate types are,
    if you need help you can ask around :)
    Be sure to add "payable" to addresses that will be handling value transfer
  */
   enum ForSale{name,sku,price,state,seller,byer};
   enum Sold{name,sku,price,state,seller,byer};
   enum Shipped{name,sku,price,state,seller,byer};
   enum Recieved{name,sku,price,state,seller,byer};
   address payable SKU = address (string);
   address myAddress = address(this);


  /* Create 4 events with the same name as each possible State (see above)
    Prefix each event with "Log" for clarity, so the forSale event will be called "LogForSale"
    Each event should accept one argument, the sku */
event LogForSale(sku);
event LogSold(sku);
event LogShipped(sku);
event LogRecieved(sku);
/* Create a modifer that checks if the msg.sender is the owner of the contract */

  modifier verifyCaller(address _address){ require (msg.sender == _address); _;}

  modifier paidEnough(uint _price){ require(msg.value >= _price); _;}
  modifier checkValue(uint _sku){

  }

  /* For each of the following modifiers, use what you learned about modifiers
   to give them functionality. For example, the forSale modifier should require
   that the item with the given sku has the state ForSale. 
   Note that the uninitialized Item.State is 0, which is also the index of the ForSale value,
   so checking that Item.State == ForSale is not sufficient to check that an Item is for sale.
   Hint: What item properties will be non-zero when an Item has been added?
   */
  modifier forSaleItem(string){
           require(msg.sender == skuCount);
  _;}
  
  modifier soldItem(string){
           require(msg.sender == skuCount);
  _;}
  
  modifier shippedItem(string){
           require(msg.sender == skuCount);
  _;}
  
  modifier receivedItem(string){
           require(msg.sender == skuCount);
  _;}
  


  constructor() public {
    /* Here, set the owner as the person who instantiated the contract
       and set your skuCount to 0. */
       msg.sender = skuCount[0];
  }

  function addItem(string memory _name, uint _price) public returns(bool){
    emit LogForSale(skuCount);
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.ForSale, seller: msg.sender, buyer: address(0)});
    skuCount = skuCount + 1;
    return true;
    uint _price = items[skuCount].price;
    uint amountToRefund = msg.value - _price;
    items[skuCount].buyer.transfer(amountToRefund);
  }

  /* Add a keyword so the function can be paid. This function should transfer money
    to the seller, set the buyer as the person who called this transaction, and set the state
    to Sold. Be careful, this function should use 3 modifiers to check if the item is for sale,
    if the buyer paid enough, and check the value after the function is called to make sure the buyer is
    refunded any excess ether sent. Remember to call the event associated with this function!*/
  
  function buyIrem(string memory _name, uint _price) public returns(bool){
  emit LogSold(skuCount);
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.Sold, buyer: msg.sender, buyer: address(0)});
    skuCount = skuCount + 1;
    return true;
    uint _price = items[skuCount].price;
    uint amountToRefund = msg.value - _price;
    items[skuCount].buyer.transfer(amountToRefund);
  }

  /* Add 2 modifiers to check if the item is sold already, and that the person calling this function
  is the seller. Change the state of the item to shipped. Remember to call the event associated with this function!*/
  
  function shippedItem(string memory _name, uint _price) public returns(bool){
  emit LogShipped(skuCount);
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.Shipped, seller: msg.sender, buyer: address(0)});
    skuCount = skuCount + 1;
    return true;
    uint _price = items[skuCount].price;
    uint amountToRefund = msg.value - _price;
    items[skuCount].buyer.transfer(amountToRefund);
   }

  /* Add 2 modifiers to check if the item is shipped already, and that the person calling this function
  is the buyer. Change the state of the item to received. Remember to call the event associated with this function!*/
  
  function receivedItem(string memory _name, uint _price) public returns(bool){
  emit LogRecieved(skuCount);
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.Shipped, buyer: msg.sender, buyer: address(0)});
    skuCount = skuCount + 1;
    return true;
    uint _price = items[skuCount].price;
    uint amountToRefund = msg.value - _price;
    items[skuCount].buyer.transfer(amountToRefund);
    }

  /* We have these functions completed so we can run tests, just ignore it :) */
  function fetchItem(uint _sku) public view returns (string memory name, uint sku, uint price, uint state, address seller, address buyer) {
    name = items[_sku].name;
    sku = items[_sku].sku;
    price = items[_sku].price;
    state = uint(items[_sku].state);
    seller = items[_sku].seller;
    buyer = items[_sku].buyer;
    return (name, sku, price, state, seller, buyer);
  }

}
