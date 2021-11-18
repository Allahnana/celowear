// SPDX-License-Identifier: MIT  
pragma solidity >=0.7.0 <0.9.0;

interface IERC20Token {
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address) external view returns (uint256);
  function allowance(address, address) external view returns (uint256);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
  
 contract Celowear{
     
     struct Cloth{
         address payable owner;
         string name;
         string description;
         string image;
         uint price;
         bool isUsed;
         
     }
     
     uint internal clothLength = 0;
     mapping (uint => Cloth) internal cloths;
     address internal cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;
     
     modifier isAdmin(){
         require(msg.sender == address(this),"Accessible only to the admin");
        _;
    }
     
     
    function addCloth (
    
        string memory _name,
        string memory _description,
        string memory _image,
        uint _price,
        bool _isUsed
    )public isAdmin(){
        cloths[clothLength] = Cloth(
            payable(msg.sender),
            _name,
            _description, 
            _image,
            _price,
            _isUsed
        );
        clothLength++;
    }
    
    
    function getCloth(uint _index)public view returns(
        address payable,
        string memory,
        string memory,
        string memory,
        uint,
        bool
    ){
        Cloth storage cloth = cloths[_index];
        return(
            cloth.owner,
            cloth.name,
            cloth.description,
            cloth.image,
            cloth.price,
            cloth.isUsed
        );
    }
    
    function buyCloth(uint _index)public payable {
        require(
            IERC20Token(cUsdTokenAddress).transferFrom(
                msg.sender,
                cloths[_index].owner,
                cloths[_index].price
            ),
            "Transaction could not be performed"
        );
        cloths[_index].owner = payable(msg.sender);
    }
    
    
    // function to check if the user is an admin
    function isUserAdmin(address _address) public view returns (bool){
        if(_address == address(this)){
            return true;
        }else{
          return false;  
        }
        
    }
    
   function getClothLength() public view returns (uint) {
        return (clothLength);
    }
 }