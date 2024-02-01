*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar o site do oregano
    Open Browser  url=http://192.168.5.74:3000/  browser=Chrome