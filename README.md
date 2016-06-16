# Mango

> Git, completely decentralised.

Using Ethereum and P2P content addressable networks (Swarm, IPFS, SSB) as a backend to Git.

**This repository is also available on Mango at mango://{...}**

**NOTE: the protocol is subject to change. With subsequent changes your past repositories can became unaccessible.**

## Get started

Prerequisites:
- an Ethereum node
- an IPFS node
- git and node.js environment

Install the helper with: `$ npm install -g git-remote-mango`

If you have a repository you want to upload:
1. Add the new remote: `$ git remote add mango mango://{repo address}`
2. Push to the new remote: `$ git push mango master`

If you know a repository you want to download: `$ git clone mango://{repo address}`

The `repo address` is the address of the repo contract - basically it is an Ethereum address. In the future, it could be a symbolic name retrieved via name systems, such as *ENS*.

You can use [MangoRepo.sol](MangoRepo.sol) as a repository contract. It is very basic and allows only the owner to publish Git updates.

If you have more than one Ethereum account in your local node, the desired address can be specified in the URL: `mango://{ethereum account}@{repo address}`

## Use in test mode

The easiest way to try out Mango is using on a test network.

I suggest to try out [testrpc](https://github.com/ethereumjs/testrpc), which is an Ethereum node simulator.

Additionally the data to IPFS will not be uploaded if an IPFS daemon is not installed and/or is not in synchronisation mode. Data will be stored and accessible locally only.

## Technical details

For the technical details see [SPECS.md](SPECS.md).

## Why is it called Mango?

I like using codenames when writing even proof of concepts.  In any case it sounded nicer than *ethergit*.

The Ethereum ecosystem has a couple of white papers, two of them are:
- the Yellow paper (EVM)
- and the Orange paper (Swarm)

Considering that a mango can be yellow, orange, red or green based on its level of ripeness it fits in well :)

## License

GPL v3

Copyright (C) 2016 Alex Beregszaszi
