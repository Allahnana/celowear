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
         bool isBlacklist;
         
     }
     
     uint internal clothLength = 0;
     mapping (uint => Cloth) public cloths;
     address internal cUsdTokenAddress;
     address adminAddress;
     
     modifier isAdmin(){
         require(msg.sender == adminAddress,"Accessible only to the admin");
        _;
    }
    
      
     modifier onlyClotheOwner(uint _index){

         require(msg.sender == cloths[_index].owner,"Accessible only to the owner of this clothe");
        _;
    }
    
    constructor(){
        // set the admin address
        adminAddress = msg.sender;
        cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;
        
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
            _isUsed,
            false
            
        );
        clothLength++;
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
    
    
    // ediit a clothe only callable by owner of cloth
    function editCloth(uint  _index,  string memory _name,
        string memory _description,
        string memory _image,
        uint _price) public onlyClotheOwner(_index){
        
        cloths[_index].name = _name;
        cloths[_index].description = _description;
        cloths[_index].image = _image;
        cloths[_index].price = _price;
        
    }
    
    
    // function to check if the user is an admin
    function isUserAdmin(address _address) public view returns (bool){
        if(_address == adminAddress){
            return true;
        }else{
          return false;  
        }
        
    }
    
   function getClothLength() public view returns (uint) {
        return (clothLength);
    }
    
    function transferOwnership(address  _address) public isAdmin {
        require(_address != address(0), "cannot use the zero address") ;
        adminAddress = _address;
    }
    
      function blackListClothe(uint _index) public isAdmin {
        cloths[_index].isBlacklist = true;
    }
    
     function unBlackListClothe(uint _index) public isAdmin {
        cloths[_index].isBlacklist = false;
    }
 }