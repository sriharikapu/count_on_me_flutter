pragma solidity 0.5.13;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721Mintable.sol";

contract Count_on_Me {
    
    // state variables
    
    enum BloodTypes {A_Plus, A_Minus, B_Plus, B_Minus, AB_Plus, AB_Minus, O_Plus, O_Minus }
    
    ERC721Mintable tokenContract;
    
    struct Donor {
        address donorAddress;
        string city;
        BloodTypes bloodType;
        uint birthDate;
        uint lastTattoo;
        uint lastDonation;
        bool active;
    }
    
    mapping (address => Donor) public donors;
    
    struct Patient {
        address patientAddress;
        string city;
        BloodTypes bloodType;
    }
    
    mapping (address => Patient) public patients;
    
    struct BloodBank {
        address bloodbankAddress;
        string city;
    }
    
    mapping (address => BloodBank) public bloodBanks;
    
    struct Donation {
        uint startDate;
        bool hasDonated;
        address patientAddress;
        address donorAddress;
        address bloodbankAddress;
    }
    
    mapping (uint => Donation) public donations;
    uint public donationCount;
    
    // events
    event NewDonor(address donorAddress, string city, BloodTypes bloodType);
    event DonorChanges(address donorAddress, string city, uint lastTattoo, uint lastDonation);
    event NewPatient(address patientAddress, string city, BloodTypes bloodType);
    event NewBloodBank(address bloodbankAddress, string city);
    event Donated(address patientAddress, address donorAddress);
    event DonationHappened(uint id);
    
    
    // functions
    constructor (address _tokenAddress) public {
        tokenContract = ERC721Mintable(_tokenAddress);
    }
    
    function donorSignup(
        string memory city,
        BloodTypes bloodType,
        uint birthDate,
        uint lastTattoo,
        uint lastDonation
        ) public {
            
        // criou a struct na memória
        Donor memory newDonor = Donor(
            msg.sender,
            city,
            bloodType,
            birthDate,
            lastTattoo,
            lastDonation,
            true);
        
        // inserindo a struct no mapping (state)
        donors[msg.sender] = newDonor;
        
        // emitindo evento
        emit NewDonor (msg.sender, city, bloodType);
    }
    
    function donorChanges(
        string memory city,
        uint lastTattoo,
        uint lastDonation
        ) public {
        require(donors[msg.sender].donorAddress != address(0), "Donor not found.");
            
        // criou um storage pointer
        Donor storage donor = donors[msg.sender];
        
        donor.city = city;
        donor.lastTattoo = lastTattoo;
        donor.lastDonation = lastDonation;
        //emit
       emit DonorChanges (msg.sender, city, lastTattoo, lastDonation);
    }
    
    // 2do patient - patientSignup
    function patientSignup(
        string memory city,
        BloodTypes bloodType
        ) public {
            
        // criou a struct na memória
        Patient memory newPatient = Patient(
            msg.sender,
            city,
            bloodType);
              
        // inserindo a struct no mapping (state)
        patients[msg.sender] = newPatient;
        
        // emitindo evento
        emit NewPatient (msg.sender, city, bloodType);
    }
        
    // 2do bank
    function bloodbankSignup(
        string memory city
        ) public {
            
        // criou a struct na memória
        BloodBank memory newBloodBank = BloodBank(
            msg.sender,
            city);
              
        // inserindo a struct no mapping (state)
        bloodBanks[msg.sender] = newBloodBank;
        
        // emitindo evento
      emit NewBloodBank (msg.sender, city);
    }
    
    // donations scheduled
    // called by donors
    function donationScheduled(address patientAddress) public {
        require(donors[msg.sender].donorAddress != address(0), "Caller is not a donor");
        require(patients[patientAddress].patientAddress != address(0), "Patient does not exist");
        //require(bloodBanks[bloodbankAddress].bloodbankAddress != address(0), "Blood Bank does not exist");
        
        // criou o struct na mem'ória
        Donation memory newDonation = Donation (
            now,
            false,
            patientAddress,
            msg.sender,
            address(0)
            );
        
        donationCount++;
        
        // gravou o struct no mapping (estado)
        donations[donationCount] = newDonation;
        
        // 2do event
       emit Donated (msg.sender, patientAddress);
    }
    
    modifier onlyBloodBank {
        require(bloodBanks[msg.sender].bloodbankAddress != address(0), "Caller is not a blood bank");
        _;
    }
    
    // donations executed
    // called by banks only
    function donationHappened (uint donationId) public onlyBloodBank {
        
        Donation storage donation = donations[donationId];
        require(donation.startDate != 0, "Donation not found");
        require(donation.hasDonated == false, "Donation has already happened");
        
        donation.hasDonated = true;
        donation.bloodbankAddress = msg.sender;
        
        // event 
        emit DonationHappened(donationId);
        
        // issue NFT to donor
        tokenContract.mint(donation.donorAddress, donationId);
        
    }
}