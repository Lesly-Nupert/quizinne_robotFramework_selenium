*** Settings***
Library    SeleniumLibrary
Resource    commun.resource
Test Template    Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
Test Setup    Ouvrir Le Navigateur Et Aller Sur La Page D'Accueil   

*** Test Cases ***
#Cas de test                                          #E-Mail                 #Mot de Passe
Test Email Valide Mot De Passe Non Valide             lesly1@lesly1.com       azerty11
Test Email Non Valide Mot De Passe Non Valide         lesly1@leslyxx.com      azerty11
Test Email Non Valide Mot De Passe Valide             lesly1@leslyxx.com      Leslyqui7+
Test Email Vide Mot De Passe Non Valide               ${EMPTY}                azerty11
Test Email Vide Mot De Passe Valide                   ${EMPTY}                Leslyqui7+
Test Email Valide Mot De Passe Vide                   lesly1@lesly1.com       ${EMPTY}
Test Email Non Valide Mot De Passe Vide               lesly1@leslyxx.com      ${EMPTY}

*** Keywords ***

Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
    [Arguments]    ${email}    ${mot_de_passe}
    Accéder A La Page De Connexion
    Entrer L'E-Mail    ${email}
    Entrer Le Mot De Passe    ${mot_de_passe}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible

Vérifier Que Le Message D'Erreur Est Visible
    Wait Until Element Is Visible    ${ESPACE POUR AFFICHER LES ERREURS}    
    # Element Text Should Be    ${ESPACE POUR AFFICHER LES ERREURS}    Email ou mot de passe incorrect. Veuillez réessayer   



