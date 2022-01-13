*** Settings ***
Resource          ../Resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test Case ***
Caso de Teste 01: Acessar o site da Atual Card
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card

Caso de Teste 02: Selecionar Balcão de Retirada
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Acessar a página de balcão de retirada
    Selecionar um estado
    Clicar chckbox entrega 12 horas
    Selecionar uma cidade
    Buscar cidade
    Conferir se balcão foi selecionado

Caso de Teste 03: Realizar Login
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado

Caso de Teste 04: Acessar Meus Pedidos e realizar ações
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Clicar no botão Meus Pedidos
    Conferir se está na página de pedidos
    Realizar filtro de pedidos
    Nomear um pedido
    Conferir se pedido foi nomeado
    Abrir modal de Mensagens

Caso de Teste 05: Abrir um pedido e realizar ações
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Clicar no botão Meus Pedidos
    Conferir se está na página de pedidos
    Abrir um pedido
    Conferir se está na página de detalhe do pedido
    # Verificar se possui reenvio de arquivos
    # Clicar no botão de reenviar arquivos
    # Enviar arquivos
    # Conferir se arquivos foram reenviados
    Abrir modal de enviar mensagem
    Mudar a forma de pagamento do pedido
    Conferir se alterou a forma de pagamento

Caso de Teste 06: Acessar Minhas Mensagens e realizar ações
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Acessar Minhas Mensagens
    Verificar se está na página de Minhas Mensagens
    Abrir nova mensagem
    Abrir tela de mensagens respondidas
    Conferir se está na tela de mensagens respondidas
    Clicar na mensagem respondida
    Reabrir mensagem respondida

Caso de Teste 07: Acessar Meus Créditos e realizar pedido
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Acessar Meus Créditos
    Conferir se está na tela Meus Créditos
    Realizar pedido de Créditos
    Conferir se pedido foi realizado


Caso de Teste 08: Acessar Meus Dados
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Clicar em Meus Dados
    Conferir se abriu a modal Meus Dados

Caso de Teste 09: Acessar Meus Favoritos
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Acessar Meus Favoritos
    Conferir se está na tela Meus Favoritos

Caso de Teste 10: Acessar Meus Endereços
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Acessar Meus Endereços
    Verificar se abriu a modal Meus Endereços
    Fechar Modal

Caso de Teste 11: Acessar Central de Privacidade
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Clicar no botão Minha Conta
    Acessar Central de Privacidade
    Conferir se abriu modal Central de Privacidade

Caso de Teste 12: Acessar Compra Fácil
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Acessar Compra Fácil
    Conferir se está na tela Compra Fácil

Caso de Teste 13: Realizar pedido com acabamento
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Selecionar o produto cartão de visitas
    Conferir se esetá na página de cartão de visitas
    Selecionar quantidade do item, acabamento e enviar ao carrinho de compras
    Verificar se item foi enviado ao carrinho de compras
    Enviar arquivos no carrinho
    Conferir se arquivos foram enviados
    Aceitar termo de garantia
    Selecionar Entrega
    Selecionar forma de pagamento
    Finalizar a compra
    Conferir pedido finalizado

Caso de Teste 14: Pesquisar um produto
    Acessar a página home do site
    Clicar para fechar a modal
    Conferir se está no site da Atual Card
    Clicar no botão de login
    Inserir CPF
    Inserir senha
    Clicar no botão entrar
    Conferir se cliente está logado
    Digitar produto "cartão de visitas" no campo de pesquisa
    Clicar no botão de pesquisar
    Conferir se produto foi pesquisado
