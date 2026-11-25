<h1 align="center">Metatron</h1>

<p align="center"><strong>Um controle na mão. Cinco equipes no placar.</strong></p>

<p align="center">
  Um projeto de estudo sobre comunicação entre dispositivos Apple com SwiftUI e MultipeerConnectivity.
</p>

<p align="center">
  <a href="#sobre">Sobre</a> ·
  <a href="#desenvolvimento">Desenvolvimento</a> ·
  <a href="#funcionalidades">Funcionalidades</a> ·
  <a href="#tecnologias">Tecnologias</a> ·
  <a href="#executando-o-projeto">Executando o projeto</a>
</p>

## Sobre

**Metatron** é um protótipo de controle remoto de pontuação: o iPhone envia comandos para adicionar ou remover pontos, enquanto uma interface de placar no Mac ou na Apple TV exibe os resultados de cinco equipes.

A comunicação utiliza **MultipeerConnectivity**, explorando a descoberta de dispositivos próximos, a criação de sessões e a troca de mensagens entre eles, sem um servidor intermediário.

**Desenvolvi este projeto sozinho, em uma semana, para estudar e experimentar as funcionalidades do MultipeerConnectivity e sua integração com o SwiftUI.**

| Objetivo | Desenvolvimento | Duração |
| --- | --- | --- |
| Estudo de comunicação entre dispositivos Apple | Individual, por André Castilhano | 1 semana |

## Desenvolvimento

A proposta foi aprender na prática como transformar uma ação em um dispositivo em uma atualização de interface em outro. Um placar com cinco equipes serviu como cenário para experimentar esse fluxo de ponta a ponta.

O estudo envolveu:

- Descoberta e anúncio de dispositivos com `MCNearbyServiceBrowser` e `MCNearbyServiceAdvertiser`.
- Conexão entre dispositivos e envio de mensagens com `MCSession`.
- Codificação e decodificação de comandos em JSON com `Codable`.
- Atualização da interface com `ObservableObject`, `@Published` e SwiftUI.
- Interfaces específicas por plataforma usando compilação condicional.

O resultado é um protótipo de estudo, com uma interface simples voltada à experimentação dessas funcionalidades.

## Funcionalidades

| Recurso | Como funciona |
| --- | --- |
| Controle pelo iPhone | Botões para enviar comandos de adição ou remoção de um ponto para cada equipe. |
| Placar de cinco equipes | Exibição das pontuações na interface destinada ao macOS e ao tvOS. |
| Descoberta automática | O aplicativo procura dispositivos próximos e envia convites de conexão. |
| Troca de mensagens | Cada comando informa a equipe e a variação de pontuação em JSON. |
| Pontuação mínima | O placar mantém os valores em zero quando uma subtração produziria um resultado negativo. |

### Fluxo de uso

1. Abra o aplicativo nos dispositivos que participarão da sessão.
2. Aguarde a descoberta e a conexão automática entre eles.
3. Use os botões no iPhone para adicionar ou remover pontos de uma equipe.
4. Acompanhe a atualização da pontuação no dispositivo que exibe o placar.

## Tecnologias

| Tecnologia | Papel no projeto |
| --- | --- |
| Swift | Lógica do aplicativo e estrutura dos comandos. |
| SwiftUI | Interfaces do controle e do placar. |
| MultipeerConnectivity | Descoberta, conexão e comunicação entre dispositivos. |
| Foundation / Codable | Serialização e leitura das mensagens em JSON. |
| Xcode | Configuração, compilação e execução do projeto. |

## Executando o projeto

### Requisitos

- Mac com **Xcode 16.4 ou posterior**, versão usada na criação do projeto.
- Para o controle no iPhone, **iOS 18.5 ou posterior**, conforme a configuração atual do projeto.
- Para experimentar a comunicação, um iPhone e um dispositivo compatível com a interface de placar, próximos e com conectividade local disponível.

### Passo a passo

1. Clone o repositório:

   ```bash
   git clone https://github.com/andrezinc/Nano4_Controller.git
   cd Nano4_Controller
   ```

2. Abra `Nano4.xcodeproj` no Xcode.
3. Selecione o esquema **Nano4** e o dispositivo de destino.
4. Para executar em dispositivos físicos, configure sua equipe em **Signing & Capabilities** e ajuste o Bundle Identifier, se necessário.
5. Compile e execute com **⌘R** nos dispositivos utilizados no teste.
6. Autorize o acesso à rede local quando solicitado e teste os comandos do controle.

O projeto contém interfaces para iOS, macOS e tvOS. As configurações de assinatura e os requisitos de implantação de cada destino devem ser conferidos no Xcode antes de executar naquela plataforma.

## Autor

Desenvolvido individualmente por [André Castilhano](https://github.com/andrezinc), em uma semana, como projeto de estudo.

## Licença

    Este projeto está licenciado sob a **Apache License 2.0**. Consulte [LICENSE](LICENSE) para mais detalhes.
