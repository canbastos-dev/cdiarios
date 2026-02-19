# Informações sobre o sistema

## Cliente: Clube dos Diários
## Período: 2009 - 2011

Registrar associados

Classificar associados por categorias: proprietário, remido, associado.

Registrar a emissão de títulos de propriedade (sócios proprietarios e remidos), e suas transferencias de titulardade. 

Registrar dependentes de associados

Registrar não-associados, usuários de serviços oferecidos pelo Clube

Registrar serviços: emissão de carteiras, academia, sauna, escolinhas. 

Controle de acesso: usuários cadastrados, restrição de acesso por inadimplência financeira

Registrar movimentações financeiras: mensalidades de pagas via secretaria do clube ou por conciliação de pagamentos de mensalidades efetivadas em instituições terceirizadas (Banco CEF, Farmácias Pague Menos); receitas oriundas dos serviços prestados pelo clube. 

## Informações técnicas

A aplicação desenvolvida em Delphi realiza a comunicação com o banco de dados Firebird por meio do ODBC Driver (Open Database Connectivity), considerando a seguinte arquitetura em camadas:
A aplicação acessa o Driver Manager do sistema operacional (odbc32.dll), que carrega o Firebird ODBC Driver (OdbcFb.dll). Este, por sua vez, utiliza a biblioteca cliente do Firebird (fbclient.dll) para estabelecer a comunicação com o servidor de banco de dados via protocolo TCP/IP na porta 3050, onde o arquivo de banco de dados (.fdb) é gerenciado pelo processo do Firebird.
A string de conexão utilizada define os parâmetros essenciais: endereço do servidor, caminho do banco de dados, credenciais de acesso, dialeto SQL e conjunto de caracteres.
Essa abordagem garante uma camada de abstração padronizada entre a aplicação e o banco de dados, permitindo a execução de comandos SQL com controle transacional gerenciado pelo driver.

## Tela conexão
![Tela de configuração conexão ODBC](/Prints/BD_Estrutura_Conexao.png "ODBC FIREBIRD 2.0")


# Principais telas do sistema e suas funcionalidades

![Tela de Aplicativo](/Prints/Aplicativo_Menu.png "Menu Principal")
Tela do menu principal, a direita painel de Opções Rápidas, atalho para procedimentos mais utilizados.

![Tela de Aplicativo](/Prints/Aplicativo_Cadastro.png "Cadastro de Associados")
Tela do cadastro de associados, multifuncional em operações, possibilitando múltiplas pesquisas em um painel .

![Tela de Aplicativo](/Prints/Aplicativo_Cadastro_Operacoes.png "Cadastro de Associados")
Filtrando o cadastro principalna própria tela de cadastros, obtendo resultado em uma tabela.

![Tela de Aplicativo](/Prints/Aplicativo_Cadastro_Operacoes_ControleDep.png "Cadastro de Associados")
Através do filtro, obtendo informações complementares sobre o associado e liberação de dependentes.

![Tela de Aplicativo](/Prints/Aplicativo_Cadastro_Operacoes_IntegracaoFin.png "Cadastro de Associados")

![Tela de Aplicativo](/Prints/Aplicativo_Cadastro_Operacoes_IntegracaoFinPagos.png "Cadastro de Associados")
Navegando pela grade e pelas abas, informações consolidadas, filtradas do Financeiro.

![Tela de Aplicativo](/Prints/Aplicativo_BaixaTitCEF.png "Cadastro de Associados")
Importação de informações produzidas por terceiros para baixas automatizadas.


![RELATORIOS](/Prints/Aplicativo_CadastroRelatorio.png "Relatórios de cadastro")
![RELATORIOS](/Prints/Aplicativo_RelatorioCadastro.png "Lista condicionada para Votações")
Relatórios cadastrais e de Liberação para Votações, dependendo da tipo do Título do associado e da sua condição de adimplência financeira.

