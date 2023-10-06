 // SPDX-License-Identifier: MIT 
pragma solidity ^0.8.21;
contract Airbnb {
    address public owner;
    uint256 public counter;
    uint256[] public rentalIds;
    constructor (){
        counter = 0;
        Owner = msg.sender;

    }

     struct PropertyInfo{
       address owner;
       address guest;
       string name;
       string propertyAddress;
       string description;
       string imgUrl;
       uint256 bookingStartsAt;
        uint256 bookingEndsAt;
        uint256 pricePerDay;
        uint256 id;
        bool isBooked;
    }

    event PropertyListedEvent{
        string name,
        string propertyAddress,
        string description,
        string imgUrl,
        uint256 priceperDay,
        uint256 id

    }

    event PropertyBookedEvent {
        uint256 id,
        address quest,
        uint256 numberofDays,
        uint256 price

    };
    mapping(uint256 => PropertyInfo) public propertless;

    function ListProperty(
        string memory name,
        string memory propertyAddress,
        string memory description,
        string memory imgurl,
        uint256 pricePerDay 

    ) public {
        PropertyInfo storage newProperty = properties[counter];

        newProperty.name = name;
        newProperty.propertyAddress = propertyAddress;
        newProperty.description = description;
        newProperty.imgUrl = imgUrl;
        newProperty.pricePerDay = pricePerDay;
        newProperty.id = counter;
        newProperty.isBooked = false;
        newProperty.bookingStartsAt = 0;
        newProperty.bookingEndsAt = 0;
        newProperty.owner = msg.sender;
        newProperty.guest = address(0);

        rentalIds.push(counter);
     emit PropertyListedEvent(

        name,
        propertyAddress,
        description,
        imgUrl,
        pricePerDay,
        counter
     );
     counter++;

    }
}