pragma solidity ^0.4.19;

// About players: Blockchain only needs to know:
// - player <==> address
// - player <==> nb of tokens
import './ownable.sol';

contract BerlinPlayers is Ownable{ // when should the modifier onlyOwner be used? --> Chris: probably not necesssary in this game...
    
    event NewPlayer(bytes32 pseudo);
    
    struct Player {
        bytes32 pseudo; // bytes32 much cheaper than string
    }
    
    Player[] public players;
    mapping (bytes32 => address) public pseudoToPlayerAddress; // find out the address of an owner via its pseudo / id 
    mapping(address => bool) public addressUsed; // have to do a second mapping to make sure addresses only once 
    
    function _createPlayer(bytes32 _pseudo) public {  
        // TO DO: pseudo has to be unique
        require(pseudoToPlayerAddress[_pseudo] == 0); // pseudo should not exist yet
        require(addressUsed[msg.sender] == false); // msg.sender should not have a pseudo yet, i.e. not be a player yet
        players.push(Player(_pseudo)); // adding this player to the players array + creating a unique id for the mapping
        pseudoToPlayerAddress[_pseudo] = msg.sender; // mapping id <--> address. 
        addressUsed[msg.sender] = true; // now this msg.sender has been used.
        NewPlayer(_pseudo); // signalize to Front-End that new player has been created.
    } //DONE - but BUGS!!!
    
}