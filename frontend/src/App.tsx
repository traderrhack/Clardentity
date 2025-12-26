import { ConnectWallet } from './components/ConnectWallet';
import './App.css';

function App() {
  return (
    <div className='app-container'>
      <header>
        <h1>Clardentity</h1>
        <ConnectWallet />
      </header>
      <main>
        <p>Welcome to Clardentity</p>
      </main>
    </div>
  );
}

export default App;
