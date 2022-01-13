# Automacao-AtualCard-RobotFramework

Projeto de automação completo do processo de compra da Gráfica Atual Card.

TECNOLOGIAS UTILIZADAS: Para realização do projeto foi utilizado Robot Framework e Selenium.

ROBOT FRAMEWORK: É uma ferramenta muito útil para automação de testes, não é necessário um conhecimento muito profunto em programação para utiliza-lo, pois é baseado em KeyWords.
No arquivo AtualCard.robot estão descritos os casos de testes, onde é possível criar vários cenários através de Keywords (palavras-chave).
No arquivo Resource.robot as keywords criados no AtualCard.robot são utilizadas juntamente com as keywords do Robot para realizar as ações necessárias.

DESCRIÇÃO DOS PROCESSOS: Realizada a simulação de um cliente onde o mesmo abre todas as telas da loja, efetua filtros e abre modais para edição de dados e envio de mensagens, nas quais ao terminar as ações foram canceladas para não impactar o ambiente de produção da empresa. Efetuado processo de compra de pedido, enviando arquivos da pasta do ambiente local. 

FINALIDADE DO PROJETO: O projeto tem o objetivo de automatizar o teste de regressão da loja Atual Card Brasil, que até o momento é realizado manualmente. 
