// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import "deploy-yul/YulDeployer.sol";

// `forge test -vvvv`
// result:
/*
[⠢] Compiling...
[⠒] Compiling 2 files with 0.8.24
[⠑] Solc 0.8.24 finished in 1.33s
Compiler run successful!

Running 1 test for test/Deployer.t.sol:DeployerTest
[PASS] test_test() (gas: 987879)
Logs:
  0xA8452Ec99ce0C64f20701dB7dD3abDb607c00496

Traces:
  [987879] DeployerTest::test_test()
    ├─ [908959] → new YulDeployer@0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
    │   └─ ← 4380 bytes of code
    ├─ [42434] YulDeployer::deployContract("Basic")
    │   ├─ [0] VM::ffi(["bash", "-c", "cast abi-encode \"f(bytes)\" $(solc --strict-assembly yul/Basic.yul --bin | tail -1)"])
    │   │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001b600e600d600039600e6000f3fe60056003018060005260206000f30000000000
    │   ├─ [0] VM::broadcast()
    │   │   └─ ← ()
    │   ├─ [2824] → new CounterScript@0xA8452Ec99ce0C64f20701dB7dD3abDb607c00496
    │   │   └─ ← 27 bytes of code
    │   └─ ← CounterScript: [0xA8452Ec99ce0C64f20701dB7dD3abDb607c00496]
    ├─ [0] console::log(CounterScript: [0xA8452Ec99ce0C64f20701dB7dD3abDb607c00496]) [staticcall]
    │   └─ ← ()
    └─ ← ()

Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 60.11ms
 
Ran 1 test suites: 1 tests passed, 0 failed, 0 skipped (1 total tests)
*/

contract DeployerTest is Test {
    function test_test() external {
        YulDeployer yulDeployer = new YulDeployer();
        address Basic = yulDeployer.deployContract("Basic");
        console.log(Basic);
    }
}
