////////////////////////////////////////////////////////////
// This is an example contract hacked together at a meetup.
// It is by far not complete and only used to show some
// features of Solidity.
////////////////////////////////////////////////////////////
contract DeliveryDroneControl {
    /// @dev account of the drone itself
    address drone;

    struct Delivery { string from; string to; }
    Delivery[] public requestQueue;

    enum Status { Idle, Delivering, ToNextDelivery }
    Status public status;

    event DeliveryRequested(string from, string to);

    /// @dev constructor, stores the address of the drone.
    function DeliveryDroneControl(address _drone) {
        drone = _drone;
    }
    
    /// @notice request drone delivery from `from` to `to`.
    function requestDelivery(string from, string to) {
        /// construct the struct "Delivery" and assign it to storage.
        var queue = requestQueue; // stores reference to storage
        queue[queue.length++] = Delivery(from, to);
        DeliveryRequested(from, to);
    }

    modifier onlyCalledByDrone() { if (msg.sender == drone) _ }

    /// @dev called by the drone to get the next location to fly to
    function getNextLocation() onlyCalledByDrone returns (string) {
        if (requestQueue.length == 0) return "";
        // @todo this is not actually a queue
        if (status == Status.Delivering)
            return requestQueue[0].to;
        else
            return requestQueue[0].from;
    }

    function delivered() calledByDrone {
    }
    
}
