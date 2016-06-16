# Mango Specification

## Introduction

Mango is new remote protocol for Git based on Ethereum and content addressable storage networks, such as IPFS and Swarm.

The goals are:
- have reasonable cost (ie. cannot store everything on Ethereum)
- be agnostic on the the data storage
- have access control in the contract

It is not a goal to support private repositories. Everything is stored on public P2P networks in an unencrypted form.

Since Git can have multiple remotes (locations to store your repository) it is possible to use Github as a day-to-day system and push releases to Mango.

## Git

Git is a version control system based on a content addressable internal storage system.

### Git architecture

#### Git objects

Objects are individual commits, blobs and other elements. Each have their own SHA1 object hash and might reference other objects by their SHA1 hashes.

#### Git packs

Each pack is made up of a data and an index file. It contains multiple objects. Packs are currently not supported.

#### Git references

References map a string (such as `refs/heads/master`) to an object hash.

### Git flow

Downloading (cloning) a Git repository composes of the following simple steps:

1. Find the latest commit of hash of the branch

2. Download the referenced top object

3. Download any further references in the tree

## Mango

Due to the inner workings of Git and the reliance on SHA1 we have very little space for deviation. These hashes cannot be altered without breaking compatibility with other Git remotes.

IPFS encapsulates data in its own storage format and the IPFS hash of said data will not be calculated based on the inner data.

Furthermore, future networks will possibly have different hashing algorithms and they might not allow SHA1.

Because of the above reasons, every Git object in Mango will have two hashes:
- Git hash
- Storage hash

### RLP

Mango uses [RLP](https://github.com/ethereum/wiki/wiki/RLP) for serialisation. RLP is used internally by Ethereum protocols.

### Objects

Objects (and packs in the future) are individually stored on IPFS.

A Git object is RLP serialised and has the following fields:
- `type` (string) - Git type, such as `tree`, `commit`, `blob`
- `length` (string) - object length as a string (FIXME)
- `blob` (binary) - the raw data

### Snapshots

Snapshots are RLP serialised arrays of `Storage hash` to `Git hash` mappings.

The first item in the array is the `version`, equaling to `1` (number).

Subsequent items are arrays consisting of:
- `githash` (string)
- `storagehash` (string)

Snapshots are stored on IPFS. The resulting IPFS hash is then stored in the repository contract. With every `git push` a new snapshot is created.

#### Contract interface

The contract needs to have the following methods:
- `function snapshotCount() constant returns (uint count)`
- `function getSnapshot(uint index) constant returns (string hash)`
- `function addSnapshot(string hash)`

### References

References are only stored in the repository contract.

#### Contract interface

The contract needs to have the following methods:
- `function refCount() constant returns (uint count)`
- `function refName(uint index) constant returns (string ref)`
- `function getRef(string ref) constant returns (string hash)`
- `function setRef(string ref, string hash)`
- `function deleteRef(string ref)`

## Future improvements

- Change the semantics to align with  [IPLD](https://github.com/ipfs/specs/tree/master/ipld)
- Support multiple networks (every `hash` in the contract will be accompanied with a `network` field)
- Have a better serialisation format for objects and snapshots
- Support Git packs
- Use arrays and multiple returns values in the contract - this means switching from web3.js to ethereumjs-abi for decoding responses
- Support deleting references (ie. deleting branches)

## Author(s)

Alex Beregszaszi ([github](https://github.com/axic), [twitter](https://twitter.com/alexberegszaszi))
