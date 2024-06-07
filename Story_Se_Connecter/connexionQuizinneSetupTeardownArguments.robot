*** Settings***
Library    SeleniumLibrary

*** Variables ***
${SERVEUR}         quizinne.netlify.app/
${QUIZINNE URL}      https://${SERVEUR}/
${NAVIGATEUR}        Chrome
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${BOUTON SE DECONNECTER}    css=.btn_logout > .fa-icon
${EMAIL VALIDE}     lesly1@lesly1.com
${MOT DE PASSE VALIDE}    Leslyqui7+
${CHAMP EMAIL}    name=email
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    document.querySelector('input.submit').click()
${TITRE QUIZINNE}    Quizinne

*** Test Cases ***
La Page d'Accueil Doit S'afficher Après Une Connexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que La Page D'Accueil Est Visible
    [Teardown]    Effectuer Une Déconnexion Réussie

Le Lien De Connexion Devrait Etre Visible Après Une Déconnexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier Que La Page D'Accueil Est Visible    
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible

*** Keywords ***
Effectuer Une Connexion Réussie
    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Accéder A La Page De Connexion
    Entrer L'E-Mail    ${EMAIL VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion

Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Open Browser    browser=${NAVIGATEUR}
    Maximize Browser Window
    Go To    ${QUIZINNE URL}

Accéder A La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    
Entrer L'E-Mail
    Wait Until Element Is Visible    ${CHAMP EMAIL}
    [Arguments]    ${email valide}
    Click Element     ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${email valide}

Entrer Le Mot De Passe
    [Arguments]    ${mot de passe}
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot de passe}

Soumettre Le Formulaire De Connexion
    Execute Javascript    ${BOUTON VALIDER}

Vérifier Que La Page D'Accueil Est Visible
    Title Should Be    ${TITRE QUIZINNE}

Effectuer Une Déconnexion Réussie
    Wait Until Element Is Visible    ${BOUTON SE DECONNECTER}
    Click Element    ${BOUTON SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN SE CONNECTER}
    Element Should Be Visible    ${LIEN SE CONNECTER}

