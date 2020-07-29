// Adapted from nomiclabs' console.log

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "./string.sol" as String;

export { log };


function _sendLogPayload(bytes memory payload) private view {
    uint256 payloadLength = payload.length;
    address consoleAddress = 0x000000000000000000636F6e736F6c652e6c6f67;
    (bool success,) = consoleAddress.staticcall{gas: gasleft()}(payload);

}

function _createSignature<A>() pure returns (string memory)
{
    return abi.encodePacked(
        "log(",
        type(A).name,
        ")"
    );
}

function _createSignature<A, B>() pure returns (string memory)
{
    return abi.encodePacked(
        "log(",
        type(A).name,
        type(B).name,
        ")"
    );
}

function _createSignature<A, B, C>() pure returns (string memory)
{
    return abi.encodePacked(
        "log(",
        type(A).name,
        type(B).name,
        type(C).name,
        ")"
    );
}

function _createSignature<A, B, C, D>() pure returns (string memory)
{
    return abi.encodePacked(
        "log(",
        type(A).name,
        type(B).name,
        type(C).name,
        type(D).name,
        ")"
    );
}

function log<A>(A a) view {
    // need 'type(A).name'
    _sendLogPayload(abi.encodeWithSignature(_createSignature::<A>(), a));
}

function log<A, B>(A a, B b) view {
    _sendLogPayload(abi.encodeWithSignature(_createSignature::<A, B>(), a, b));
}

function log<A, B, C>(A a, B b, C c) view {
    _sendLogPayload(abi.encodeWithSignature(_createSignature::<A, B, C>(), a, b, c));
}

function log<A, B, C, D>(A a, B b, C c, D d) view {
    _sendLogPayload(abi.encodeWithSignature(_createSignature::<A, B, C, D>(), a, b, c, d));
}