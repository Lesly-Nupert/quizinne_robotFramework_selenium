*** Settings***
Library    SeleniumLibrary
Resource    commun.resource


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

Vérifier Que Le Message D'Erreur Est Visible
    Wait Until Element Is Visible    ${ESPACE POUR AFFICHER LES ERREURS}    
    # Element Text Should Be    ${ESPACE POUR AFFICHER LES ERREURS}    Email ou mot de passe incorrect. Veuillez réessayer   



