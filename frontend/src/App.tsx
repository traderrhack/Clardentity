import { ConnectWallet } from './components/ConnectWallet';
import { Hero } from './components/Hero';
import { Footer } from './components/Footer';
import './App.css';

function App() {
  return (
    <div className='app-container'>
      <header>
        <h1>Clardentity</h1>
        <ConnectWallet />
      </header>
      <main>
        <Hero />
        <section className='content'>
          <p>Secure identity on Stacks.</p>
        </section>
      </main>
      <Footer />
    </div>
  );
}

export default App;
