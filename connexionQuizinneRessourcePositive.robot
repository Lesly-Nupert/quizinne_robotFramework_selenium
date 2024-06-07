*** Settings ***
Library    SeleniumLibrary
Resource    commun.resource


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

Vérifier Que La Page D'Accueil Est Visible
    Title Should Be    ${TITRE QUIZINNE}
    Wait Until Element Is Visible    ${BOUTON SE DECONNECTER}
    

Effectuer Une Déconnexion Réussie
    Click Element    ${BOUTON SE DECONNECTER} 
    Wait Until Element Is Not Visible    ${BOUTON SE DECONNECTER} 
    
Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN SE CONNECTER} 