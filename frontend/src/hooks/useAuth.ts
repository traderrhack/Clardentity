import { useState, useEffect } from 'react';
import { userSession } from '../config/stacks';
import { UserData } from '@stacks/connect';

export const useAuth = () => {
  const [userData, setUserData] = useState<UserData | null>(null);

  useEffect(() => {
    if (userSession.isUserSignedIn()) {
      setUserData(userSession.loadUserData());
    }
  }, []);

  return { userData, userSession };
};
