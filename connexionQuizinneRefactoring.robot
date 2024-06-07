*** Settings***
Library    SeleniumLibrary

*** Test Cases ***
La Page d'Accueil Doit S'afficher Après Une Connexion Réussie
    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Accéder A La Page De Connexion
    Entrer L'E-Mail
    Entrer Le Mot De Passe
    Soumettre Le Formulaire De Connexion
    Vérifier Que La Page D'Accueil Est Affichée

*** Keywords ***
Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    https://quizinne.netlify.app/#/

Accéder A La Page De Connexion
    Click Element    xpath=//a[contains(text(),'Se connecter')]
    Wait Until Element Is Visible    name=email

Entrer L'E-Mail
    Click Element     name=email
    Input Text    name=email    lesly1@lesly1.com

Entrer Le Mot De Passe
    Click Element     name=password
    Input Text    name=password    Leslyqui7+

Soumettre Le Formulaire De Connexion
    Execute Javascript    document.querySelector('input.submit').click()

Vérifier Que La Page D'Accueil Est Affichée
    Title Should Be    Quizinne


