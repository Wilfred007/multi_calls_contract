// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const Multicall2 = buildModule("Multicall2", (m) => {

  const Multicall2 = m.contract("Multicall2");

  return { Multicall2 };
});

export default Multicall2;
