const cards = [
  {
    title: 'Soluções Inteligentes',
    description:
      'Automatize processos de comunicação digital e acelere o atendimento do seu negócio com um fluxo simples e eficiente.',
  },
  {
    title: 'Implementação Ágil',
    description:
      'Estrutura enxuta em React para você apresentar serviços, resultados e canais de contato em um único lugar.',
  },
  {
    title: 'Foco em Conversão',
    description:
      'Layout inspirado em portais corporativos, com chamadas diretas para gerar leads e aumentar sua presença online.',
  },
];

const services = [
  'Consultoria em presença digital',
  'Landing pages de alta conversão',
  'Integração com canais de atendimento',
  'Gestão de campanhas e conteúdo',
];

export default function App() {
  return (
    <div className="portal">
      <header className="hero">
        <div className="overlay" />
        <nav className="nav container">
          <div className="logo">CF7 Brasil</div>
          <ul>
            <li>Início</li>
            <li>Serviços</li>
            <li>Sobre</li>
            <li>Contato</li>
          </ul>
        </nav>

        <div className="hero-content container">
          <p className="tag">Portal em React</p>
          <h1>Transforme seu site institucional em um canal de geração de negócios</h1>
          <p>
            Este portal foi criado com base na proposta visual e comercial do site da CF7 Brasil,
            priorizando clareza, confiança e conversão.
          </p>
          <div className="actions">
            <button className="btn primary">Solicitar proposta</button>
            <button className="btn secondary">Falar com especialista</button>
          </div>
        </div>
      </header>

      <main>
        <section className="highlights container">
          {cards.map((card) => (
            <article key={card.title} className="card">
              <h3>{card.title}</h3>
              <p>{card.description}</p>
            </article>
          ))}
        </section>

        <section className="about">
          <div className="container about-grid">
            <div>
              <h2>Portal moderno para negócios digitais</h2>
              <p>
                Com estrutura escalável, este projeto pode evoluir para incluir blog, área do cliente,
                integração com CRM e analytics para acompanhar resultados em tempo real.
              </p>
            </div>
            <ul>
              {services.map((item) => (
                <li key={item}>{item}</li>
              ))}
            </ul>
          </div>
        </section>
      </main>

      <footer className="footer">
        <div className="container">
          <h4>CF7 Brasil • Portal React</h4>
          <p>Projeto base para apresentar serviços, autoridade e captar novos clientes.</p>
        </div>
      </footer>
    </div>
  );
}
