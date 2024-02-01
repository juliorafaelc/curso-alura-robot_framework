*** Settings ***
Resource        ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar mensagem de erro ao não preencher o formulario corretamente
    Dado que eu clique no botão criar card
    Então o sistema deve me mostrar as mensagens de erro de formulario
