pragma solidity ^0.4.19;

// Question: ownership of areas - in areas OR players OR both?
// About Areas: Blockchain only needs to know:
// - area <==> price
// - area <==> owner

// BerlinAreas only initialized when buying per area happens:
// --> should I use a constructor? (only executed once when contract is called)
// here could be only the contract for initializing the Areas.
import './ownable.sol';

contract BerlinAreas is Ownable{ // use the onlyOwner modifier for the initializing? --> Chris: probably not necesssary in this game...
    
    struct Bezirk {
        string name;
        uint price;
        uint nbTx;
    }
    
    //Bezirk[12] public bezirke;
    function getAreas() constant public returns (Bezirk[1]) { // having trouble
        Bezirk[1] memory bezirke = [Bezirk("Kreuzberg", 100, 0)];
        return bezirke;
    }
    
    
    
}