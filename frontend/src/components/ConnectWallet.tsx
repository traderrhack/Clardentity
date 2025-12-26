import { showConnect } from '@stacks/connect';
import { userSession } from '../config/stacks';
import { APP_NAME, APP_ICON } from '../utils/constants';

export const ConnectWallet = () => {
  const authenticate = () => {
    showConnect({
      appDetails: {
        name: APP_NAME,
        icon: window.location.origin + '/' + APP_ICON,
      },
      redirectTo: '/',
      onFinish: () => {
        window.location.reload();
      },
      userSession,
    });
  };

  if (userSession.isUserSignedIn()) {
    return (
      <button onClick={() => userSession.signUserOut('/')}>
        Disconnect {userSession.loadUserData().profile.stxAddress.mainnet}
      </button>
    );
  }

  return (
    <button onClick={authenticate}>
      Connect Wallet
    </button>
  );
};
