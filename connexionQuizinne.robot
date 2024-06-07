*** Settings ***
Library           SeleniumLibrary
*** Test Cases ***
La page d'accueil doit s'afficher après une connexion réussie
    Open Browser    browser=Chrome
    Go To    https://quizinne.netlify.app/#/
    Maximize Browser Window
    Click Element    xpath=//a[contains(text(),'Se connecter')]
    Wait Until Element Is Visible    name=email
    Click Element     name=email
    Input Text    name=email    lesly1@lesly1.com
    Click Element     name=password
    Input Text    name=password    Leslyqui7+
    Execute Javascript    document.querySelector('input.submit').click()  
    Title Should Be    Quizinne