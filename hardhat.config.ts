import '@nomiclabs/hardhat-etherscan';
import '@nomiclabs/hardhat-waffle';
import '@typechain/hardhat';
import 'hardhat-gas-reporter';
import 'solidity-coverage';

import * as dotenv from 'dotenv';
import { HardhatUserConfig, task } from 'hardhat/config';

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.12",
  defaultNetwork: "hardhat",
  networks: {
    polygon_main: {
      url: process.env.MAIN_NET,
      accounts: [process.env.PRIVATE_KEY!],
    },
    polygon_test: {
      url: process.env.TEST_NET,
      accounts: [process.env.PRIVATE_KEY!],
    },
    hardhat: {
      forking: {
        url: process.env.MAIN_NET!,
      },
    },
  },
  gasReporter: {
    enabled: true,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.SCAN_API_KEY,
  },
  mocha: {
    timeout: 9999999
  }
};

export default config;
