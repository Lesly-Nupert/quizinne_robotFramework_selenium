*** Settings***
Library    SeleniumLibrary

*** Variables ***
${SERVEUR}         quizinne.netlify.app/
${QUIZINNE URL}      https://${SERVEUR}/
${NAVIGATEUR}        Chrome
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${EMAIL VALIDE}     lesly1@lesly1.com
${MOT DE PASSE VALIDE}    Leslyqui7+
${CHAMP EMAIL}    name=email
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    document.querySelector('input.submit').click()
${TITRE QUIZINNE}    Quizinne

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
    Open Browser    browser=${NAVIGATEUR}
    Maximize Browser Window
    Go To    ${QUIZINNE URL}

Accéder A La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP EMAIL}

Entrer L'E-Mail
    Click Element     ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${EMAIL VALIDE}

Entrer Le Mot De Passe
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${MOT DE PASSE VALIDE}

Soumettre Le Formulaire De Connexion
    Execute Javascript    ${BOUTON VALIDER}

Vérifier Que La Page D'Accueil Est Affichée
    Title Should Be    ${TITRE QUIZINNE}


