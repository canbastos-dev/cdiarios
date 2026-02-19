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



# Principais telas do sistema e suas funcionalidades

