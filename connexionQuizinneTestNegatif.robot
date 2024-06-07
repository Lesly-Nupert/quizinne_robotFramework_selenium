*** Settings***
Library    SeleniumLibrary

*** Variables ***
${SERVEUR}         quizinne.netlify.app/
${QUIZINNE URL}      https://${SERVEUR}/
${NAVIGATEUR}        Chrome
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${EMAIL VALIDE}     lesly1@lesly1.com
${MOT DE PASSE VALIDE}    Leslyqui7+
${EMAIL NON VALIDE}    lesly1@lesly1.com1234
${MOT DE PASSE NON VALIDE}    Leslyqui77
${CHAMP EMAIL}    name=email
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    document.querySelector('input.submit').click()
${ESPACE POUR AFFICHER LES ERREURS}    css=.error_message

*** Test Cases ***
Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte Email Valide Et Mot De Passe Invalide
    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Accéder A La Page De Connexion
    Entrer L'E-Mail    ${EMAIL VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE NON VALIDE}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible

Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte Email Invalide Et Mot De Passe Valide
    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Accéder A La Page De Connexion
    Entrer L'E-Mail    ${EMAIL NON VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible

Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte Email Invalide Et Mot De Passe Invalide
    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Accéder A La Page De Connexion
    Entrer L'E-Mail    ${EMAIL NON VALIDE}
    Entrer Le Mot De Passe    ${MOT DE PASSE NON VALIDE}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible

*** Keywords ***
Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil
    Open Browser    browser=${NAVIGATEUR}
    Maximize Browser Window
    Go To    ${QUIZINNE URL}

Accéder A La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP EMAIL}

Entrer L'E-Mail
    [Arguments]    ${email}
    Click Element     ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${email}

Entrer Le Mot De Passe
    [Arguments]    ${mot_de_passe}
    Click Element     ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Soumettre Le Formulaire De Connexion
    Execute Javascript    ${BOUTON VALIDER}

Vérifier Que Le Message D'Erreur Est Visible
    Wait Until Element Is Visible    ${ESPACE POUR AFFICHER LES ERREURS}    
    # Element Text Should Be    ${ESPACE POUR AFFICHER LES ERREURS}    Email ou mot de passe incorrect. Veuillez réessayer   



