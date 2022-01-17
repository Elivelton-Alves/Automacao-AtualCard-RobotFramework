*** Settings ***
Library     SeleniumLibrary
Library     String



*** Variables ***
${BROWSER}      chrome
${URL}          https://www.atualcard.com.br/
${PRODUTO}

*** Keywords ***
###Setup e Teardown###
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

### CASO DE TESTE 01: ACESSAR O SITE DA ATUAL CARD
Acessar a página home do site
    Go To   ${URL}
    Maximize Browser Window


Clicar para fechar a modal
    Wait Until Element Is Visible    xpath=/html/body/div[3]/form/div/button
    Click Element                    xpath=/html/body/div[3]/form/div/button
    Wait Until Element Is Visible    xpath=//*[@id="modal-promo"]/div/header/a
    Click Element                    xpath=//*[@id="modal-promo"]/div/header/a
    Wait Until Element Is Visible    xpath=/html/body/div[8]/div/div[5]/a[1]
    Click Element                    xpath=/html/body/div[8]/div/div[5]/a[1]

Conferir se está no site da Atual Card
    Sleep                            2s
    Title Should Be                  Atual Card | Impressão Offset e Digital | Gráfica Online


### CASO DE TESTE 02: SELECIONAR BALCÃO DE RETIRADA                                       https://cdn.atualcard.com.br/assets/images/logo-atual-card.svg?uid=753773583c8f6794c34fb4cb3d718818
Acessar a página de balcão de retirada
    Wait Until Element Is Visible    xpath=/html/body//a[@title='Balcões de Retirada']
    Click Element                    xpath=/html/body//a[@title='Balcões de Retirada']

Selecionar um estado
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div/section/div/div[2]/div/ul/li[1]/a
    Click Element                    xpath=/html/body/div[2]/div/main/div/section/div/div[2]/div/ul/li[1]/a

Clicar chckbox entrega 12 horas
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[2]/div[2]/label/span
    Click Element                    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[2]/div[2]/label/span

Selecionar uma cidade
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[1]/div[1]/div/div/div/select
    Click Element                    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[1]/div[1]/div/div/div/select
    Click Element                    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[1]/div[1]/div/div/div/select/option[199]

Buscar cidade
    Click Button                     xpath=/html/body/div[2]/div//button
    Sleep                            2s

Conferir se balcão foi selecionado
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[2]/div[2]/label/span
    Checkbox Should Be Selected      xpath=/html/body/div[2]/div/main/div[2]/div/div[1]/div[2]/form/div[2]/div[2]/label/input[1]

### CASO DE TESTE 03: REALIZAR LOGIN
Clicar no botão de Login
    Wait Until Element Is Visible    xpath=/html/body//a[@class="nav-user__link js-trigger-login"]
    Sleep                            1s
    Click Element                    xpath=/html/body//a[@class="nav-user__link js-trigger-login"]
    Sleep                            2s

Inserir CPF
    Input Text                       name:login    xxxxxxxxxxx

Inserir senha
    Input Password                   name:senha    xxxxxx

Clicar no botão entrar
    Sleep                           1s
    Click Element                   xpath=//*[@id="modal-login"]//button[@class="btn btn--primary js-btn-login"]

Conferir se cliente está logado
    Wait Until Element Is Visible  xpath=/html/body/div[2]/header/section[2]/div[3]/div/ul/li[2]/a
    Page Should Contain Link       xpath=/html/body/div[2]/header/section[2]/div[3]/div/ul/li[2]/a
    Sleep                          1s
    Page Should Contain            Minha Conta
    Sleep                          2s

### CASO DE TESTE 04: ACESSAR MEUS PEDIDOS E REALIZAR AÇÕES
Clicar no botão Minha Conta
    Click Element                  xpath= /html/body/div[2]/header/section[2]/div[3]/div/ul/li[5]/a[@class="nav-user__link"]

Clicar no botão Meus Pedidos
    Wait Until Element Is Visible    xpath=/html/body/div[2]/header/section[2]/div[3]/div/ul/li[5]/ul//a[@title='Meus Pedidos']
    Click Element                    xpath=/html/body/div[2]/header/section[2]/div[3]/div/ul/li[5]/ul//a[@title='Meus Pedidos']

Conferir se está na página de pedidos
    Sleep                            1s
    Title Should Be                  Meus Pedidos | Gráfica Online Atual Card
    Page Should Contain              Meus Pedidos

Realizar filtro de pedidos
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div/div/div/section[1]/form/div[2]//label[contains(text(),"Status do pedido")]
    Click Element                    xpath=/html/body/div[2]/div/main/div/div/div/section[1]/form/div[2]/div[1]/div/select[@name="pk_status_pedido"]
    Click Element                    xpath=/html/body/div[2]/div/main/div/div/div/section[1]/form/div[2]/div[1]/div/select/option[contains(text(),"Arquivo C/ Problemas")]
    Click Button                     xpath=/html/body/div[2]/div/main/div/div/div/section[1]/form/div[3]/button[@class="btn btn--primary btn--block"]
    Sleep                            1s
    Click Button                     xpath=/html/body/div[2]/div/main/div/div/div/section[1]/form/div[3]/button[@class="btn btn--link btn--block js-clear-form"]

Nomear um pedido
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div/div/div/section[2]/div[1]/table/tbody/tr[1]/td[4]/button
    Click Button                     xpath=/html/body/div[2]/div/main/div/div/div/section[2]/div[1]/table/tbody/tr[1]/td[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="modal-save-name"]//div[@class="modal__content"]
    Sleep                            1s
    Input Text                       name:name_pedido    Teste
    Sleep                            2s
    Click Button                     xpath=//*[@id="modal-save-name"]/div/div/form/footer/div/button[2][contains(text(),"Enviar")]

Conferir se pedido foi nomeado
    Should Not Be Empty              xpath=/html/body/div[2]/div/main/div/div/div/section[2]/div[1]/table/tbody/tr[1]/td[4]/span

Abrir modal de Mensagens
    Click Element                    xpath=/html/body/div[2]/div/main/div/div/div/section[2]/div[1]/table/tbody/tr[1]/td[6]/button
    Wait Until Element Is Visible    xpath=//*[@id="modal-called"]//textarea[@name="mensagem"]
    Input Text                       name:mensagem    Teste Mensagem
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-called"]/div/div/form/footer/div/button[contains(text(),"Cancelar")]

### CASO DE TESTE 05: ABRIR UM PEDIDO E REALIZAR AÇÕES
Abrir um pedido
    Sleep                            3s
    Click Element                    xpath=/html/body/div[2]/div/main/div/div/div/section[2]/div[1]/table/tbody/tr[1]

Conferir se está na página de detalhe do pedido
    Page Should Contain              Resumo do Pedido
    Page Should Contain              Dados de Pagamento
    Page Should Contain              Histórico do Pedido

Verificar se possui reenvio de arquivos
    Page Should Contain              Solicitar reenvio de arquivos

Clicar no botão de reenviar arquivos
    Wait Until Element Is Visible    css=#prod-1 > div.prod__footer button
    Click Element                    css=#prod-1 > div.prod__footer button
    Wait Until Element Is Visible    xpath=//*[@id="modal-confirm-resend"]//button[@class="btn btn--primary js-open-modal-upload"]
    Click Element                    xpath=//*[@id="modal-confirm-resend"]//button[@class="btn btn--primary js-open-modal-upload"]
    Wait Until Page Contains         Reenviar Arquivos
    Sleep                            1s
    Click Element                    xpath=//*[@id="prod-1"]//button[@class="btn btn--danger js-open-modal-resend"]
    Sleep                            1s
    Choose File                      xpath=//*[@id="124964"]    C:/Users/elivelton.alves/Desktop/Elivelton/Teste.jpg

Enviar arquivos
    Sleep                           2s
    Click Element                   xpath=//*[@id="modal-upload-files"]//button[@class="btn btn--primary js-upload-files"]

Conferir se arquivos foram reenviados
    Sleep                           3s
    Page Should Contain             Solicitar reenvio de arquivos
    Page Should Contain             Mudar pagamento

Abrir modal de enviar mensagem
    Wait Until Element Is Visible    xpath=//button[@class="btn btn--primary js-open-modal-called"]
    Click Element                    xpath=//button[@class="btn btn--primary js-open-modal-called"]
    Wait Until Element Is Visible    css=#modal-called textarea
    Input Text                       name:mensagem    Mensagem de Teste
    Sleep                            2s
    Click Element                    xpath=//*[@id="modal-called"]//button[@class="btn btn--link js-modal-close"]

Mudar a forma de pagamento do pedido
    Sleep                            1s
    Click Element                    xpath=//button[@class="btn btn--default btn--block js-open-modal-payment"]
    Wait Until Element Is Visible    css=#modal-payment > div > div
    Sleep                            2s
    Click Element                    xpath=//*[@id="modal-payment"]/div/div/div/form/div[1]/ul/li[4]/label
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-payment"]//button[@class="btn btn--primary js-submit" ]

Conferir se alterou a forma de pagamento
    Sleep                            2s
    Page Should Contain              Pix Pendente
    Page Should Contain              Gerar QR CODE

### CASO DE TESTE 06: ACESSAR MINHAS MENSAGENS E REALIZAR AÇÕES
Acessar Minhas Mensagens
    Sleep                            2s
    Click Element                   xpath=/html/body/div[2]/header//a[@title="Minhas Mensagens"]

Verificar se está na página de Minhas Mensagens
    Page Should Contain             Minhas Mensagens
    Title Should Be                 Minhas Mensagens | Gráfica Online Atual Card

Abrir nova mensagem
    Wait Until Element Is Visible    xpath=//button[@class="btn btn--primary js-open-modal-open-called"]
    Click Element                    xpath=//button[@class="btn btn--primary js-open-modal-open-called"]
    Wait Until Element Is Visible    xpath=//input[@class="field js-field-order-id js-modal-assunto"]
    Input Text                       name:titulo    Mensagem de Teste
    Input Text                       name:mensagem    Teste de Mensagem
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-called"]//button[@class="btn btn--link js-modal-close"]

Abrir tela de mensagens respondidas
    Click Element                    xpath=//a[@class="nav-tabs__item js-tab-trigger"]

Conferir se está na tela de mensagens respondidas
    Page Should Contain              Avaliar
    Page Should Contain              Resolvido

Clicar na mensagem respondida
    Click Element                    xpath=/html/body/div[2]/div/main/div[1]/div[2]/div/section[2]/div[2]/div[1]/table/tbody/tr[1]

Reabrir mensagem respondida
    Wait Until Element Is Visible    xpath=//button[contains(text(),"Reabrir Mensagem")]
    Sleep                            1s
    Click Element                    xpath=//button[contains(text(),"Reabrir Mensagem")]
    Sleep                            1s
    Input Text                       name:mensagem    Mensagem Teste
    Click Element                    xpath=//button[1][@class="btn btn--link js-modal-close"]
    Sleep                            2s

### CASO DE TESTE 07: ACESSAR MEUS CRÉDITOS E REALIZAR PEDIDO
Acessar Meus Créditos
    Wait Until Element Is Visible    xpath=//a[@title="Meus Créditos"]
    Click Element                    xpath=//a[@title="Meus Créditos"]

Conferir se está na tela Meus Créditos
    Page Should Contain              Meus Créditos
    Title Should Be                  Meus Créditos | Gráfica Online Atual Card

Realizar pedido de Créditos
    Wait Until Element Is Visible    xpath=//a[@title="Comprar créditos"]
    Click Element                    xpath=//a[@title="Comprar créditos"]
    Wait Until Element Is Visible    xpath=//button[@class="btn btn--danger btn--block js-comprar-credito"]
    Click Element                    xpath=//button[@class="btn btn--danger btn--block js-comprar-credito"]
    Wait Until Element Is Visible    xpath=//button[@title="Realizar pagamento"]
    Click Element                    xpath=//button[@title="Realizar pagamento"]
    Wait Until Element Is Visible    xpath=//section[@class="panel__content js-tab"]
    Sleep                            1s
    Click Element                    xpath=/html/body/div[2]/div/main/form/div/div/div[2]/div/section/div[1]/ul/li[3]/label
    Sleep                            1s
    Click Element                    xpath=//button[2][@title="Finalizar pedido"]

Conferir se pedido foi realizado
   Page Should Contain               Resumo do Pedido
   Sleep                             1s
   Reload Page
   Sleep                            2s

### CASO DE TESTE 08: ACESSAR MEUS DADOS
Clicar em Meus Dados
    Wait Until Element Is Visible    xpath=//a[@title="Meus Dados"]
    Click Element                    xpath=//a[@title="Meus Dados"]

Conferir se abriu a modal Meus Dados
    Page Should Contain Element      xpath=//*[@id="modal-register"]/div[2]/div
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-register"]/div[2]/div/form/footer/div/button[1]
    Sleep                            2s

### CASO DE TESTE 09: ACESSAR MEUS FAVORITOS
Acessar Meus Favoritos
    Wait Until Element Is Visible    xpath=//a[@title="Meus Favoritos"]
    Click Element                    xpath=//a[@title="Meus Favoritos"]

Conferir se está na tela Meus Favoritos
    Page Should Contain              Meus Favoritos
    Sleep                            2s

### CASO DE TESTE 10: ACESSAR MEUS ENDEREÇOS
Acessar Meus Endereços
    Wait Until Element Is Visible    xpath=//a[@title="Meus Endereços"]
    Click Element                    xpath=//a[@title="Meus Endereços"]

Verificar se abriu a modal Meus Endereços
    Page Should Contain Element      css=#modal-list-address > div > div > div.u-padding-2

Fechar Modal
    Sleep                            2s
    Click Element                    xpath=//*[@id="modal-list-address"]/div/div/footer/button[1]
    Sleep                            2s
### CASO DE TESTE 11: ACESSAR CENTRAL DE PRIVACIDADE
Acessar Central de Privacidade
    Wait Until Element Is Visible    xpath=//a[@title="Central de Privacidade"]
    Click Element                    xpath=//a[@title="Central de Privacidade"]

Conferir se abriu modal Central de Privacidade
    Page Should Contain Element      css=#modal-privacy > div > div
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-privacy"]/div/div/form/footer/div[2]/button[1]
    Sleep                            2s

### CASO DE TESTE 12: ACESSAR COMPRA FÁCIL
Acessar Compra Fácil
    Wait Until Element Is Visible    xpath=//a[@title="Compra Fácil"]
    Click Element                    xpath=//a[@title="Compra Fácil"]

Conferir se está na tela Compra Fácil
    Page Should Contain              MEUS PRODUTOS MAIS COMPRADOS

### CASO DE TESTE 13: REALIZAR PEDIDO COM ACABAMENTO
Selecionar o produto cartão de visitas
    Click Element                    xpath=//a[@title="Cartão de Visita"]
    Wait Until Element Is Visible    css=#menu_75
    Click Element                    css=#menu_75

Conferir se esetá na página de cartão de visitas
    Page Should Contain              Cartões de Visita

Selecionar quantidade do item, acabamento e enviar ao carrinho de compras
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/main/div[1]/section/div[2]/form/div[2]/div[1]/div[1]/ul[1]/li[3]/label/input
    Sleep                            1s
    Click Element                    xpath=/html/body/div[2]/div/main/div[1]/section/div[2]/form/div[2]/div[1]/div[1]/ul[1]/li[3]/label/span
    Sleep                            2s
    Click Element                    xpath=/html/body/div[2]/div/main/div[1]/section/div[2]/form/div[2]/div[1]/div[2]/ul/li[7]/label/span
    Sleep                            1s
    Click Element                    xpath=//button[@title="Comprar produto"]

Verificar se item foi enviado ao carrinho de compras
    Sleep                            1s
    Title Should Be                  Carrinho | Gráfica Online Atual Card
    Page Should Contain              Carrinho

Enviar arquivos no carrinho
    Wait Until Element Is Visible    css=#prod-1 > footer > button
    Click Element                    css=#prod-1 > footer > button
    Wait Until Element Is Visible    css=#field_input_a_6 > label.file
    Sleep                            2s
    Choose File                      css=div.js-upload-padrao form div label.file input[id="31443"]    C:/Users/elivelton.alves/Desktop/Elivelton/Teste.jpg
    Choose File                      xpath=//*[@id="a_6"]    C:/Users/elivelton.alves/Desktop/Elivelton/Teste.jpg
    Sleep                            1s
    Click Element                    xpath=//button[@class="btn btn--primary js-upload-files"]

Conferir se arquivos foram enviados
    Page Should Contain              Arquivos enviados com Sucesso!

Aceitar termo de garantia
    Sleep                            2s
    Execute Javascript               document.querySelector(".js-terms").checked = true;

Selecionar Entrega
    Click Element                    xpath=//*[@id="summary"]/div[2]/button
    Sleep                            3s
    Click Element                    xpath=/html/body/div[2]/div/main/form/div/div/div[2]/div[2]/section/div/div[1]/div/div/label[1]/span/span

Selecionar forma de pagamento
    Click Element                    xpath=/html/body/div[2]/div/main/form/div/div/div[2]/div[3]/section/div[1]/ul/li[3]/label/span

Finalizar a compra
    Sleep                            1s
    Click Element                    xpath=//*[@id="summary"]//button[@title="Finalizar pedido"]
    Sleep                            2s
    Input Text                       //input[@class="field js-receiver-contact"]   teste
    Input Text                       //input[@class="field js-receiver-phone"]    41999999999
    Sleep                            1s
    Click Element                    xpath=//*[@id="modal-receiver"]//button[contains(text(),"Confirmar")]

Conferir pedido finalizado
    Sleep                            2s
    Reload Page
    Page Should Contain              Resumo do Pedido
    Page Should Contain              Dados de Pagamento


### CASO DE TESTE 14: PESQUISAR UM PRODUTO
Digitar produto "${PRODUTO}" no campo de pesquisa
    Input Text                      name:keywords    cartão de visitas

Clicar no botão de pesquisar
    Click Element                   xpath=//button[@title="Buscar"]

Conferir se produto foi pesquisado
    Page Should Contain             Busca
    Page Should Contain Element     xpath=/html/body/div[2]/div/main/div/section/div[4]
