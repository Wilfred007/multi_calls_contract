// import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


// const WFTToken = buildModule("WFTToken", (m) => {

//   const WFTToken = m.contract("WFTToken");

//   return { WFTToken };
// });

// export default WFTToken;

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const tokenAddress = "0x2b43B0C5BA5e358D7D38B4657E503a26c1554dAA";

const WFTToken = buildModule("WFTToken", (m) => {

    const WFTToken = m.contract("WFTToken", [tokenAddress]);

    return { WFTToken };
});

export default WFTToken;