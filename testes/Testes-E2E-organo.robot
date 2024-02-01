*** Settings ***
Resource        ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Preencher os campos do formulario e gerar um novo card
    Dado que eu preencha os campos do formulario
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar a adição de novos cards ao preencher os campos corretamente
    Dado que eu preencha os campos do formulario
    E clique no botão criar card
    Então identificar a presença de multiplos cards na equipe 

Verificar se é posivel criar um card para cada time disponivel
    Dado que eu preencha os campos do formulario
    Então criar e identificar 1 card em cada time
