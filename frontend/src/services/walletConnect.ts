import { Core } from '@walletconnect/core';
import { Web3Wallet } from '@reown/walletkit';

const core = new Core({
  projectId: 'YOUR_PROJECT_ID'
});

export const initWalletConnect = async () => {
  const web3wallet = await Web3Wallet.init({
    core,
    metadata: {
      name: 'Clardentity',
      description: 'Clardentity Stacks App',
      url: 'https://clardentity.app',
      icons: []
    }
  });
  return web3wallet;
};
