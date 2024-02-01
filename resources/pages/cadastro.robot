*** Settings ***
Resource    ../main.robot

*** Variables ***
${ERRO_NOME}              id:form-nome-erro
${ERRO_CARGO}             id:form-cargo-erro
${ERRO_TIME}              id:form-times-erro
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{Selecionar_Times}       
...              //option[contains(.,'Programação')]
...              //option[contains(.,'Front-End')]
...              //option[contains(.,'Data Science')]
...              //option[contains(.,'Devops')] 
...              //option[contains(.,'UX e Design')]
...              //option[contains(.,'Mobile')]
...              //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
Dado que eu clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então o sistema deve me mostrar as mensagens de erro de formulario
    Element Should Be Visible    ${ERRO_NOME}
    Element Should Be Visible    ${ERRO_CARGO}
    Element Should Be Visible    ${ERRO_TIME}
    Sleep    5s

Dado que eu preencha os campos do formulario
    ${Nome}          FakerLibrary.Name
    Input Text       ${CAMPO_NOME}     ${Nome}
    ${Cargo}         FakerLibrary.Job  
    Input Text       ${CAMPO_CARGO}    ${Cargo}
    ${Imagem}        FakerLibrary.Image Url    width=100    height=100
    Input Text       ${CAMPO_IMAGEM}   ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${Selecionar_Times}[0]

E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
    Sleep    5s

Então identificar a presença de multiplos cards na equipe   
    FOR    ${i}    IN RANGE    1    3
    Dado que eu preencha os campos do formulario
    E clique no botão criar card    
    END
    Sleep    5s  

Então criar e identificar 1 card em cada time
    FOR    ${indice}    ${time}    IN ENUMERATE    @{Selecionar_Times}
        Dado que eu preencha os campos do formulario
        Click Element    ${time}
        E clique no botão criar card      
    END
    Sleep    5s  

