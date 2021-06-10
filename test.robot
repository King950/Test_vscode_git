*** Settings ***
Documentation     entrainement robotframework via visual studio
Library    Dialogs
Library    DateTime
Library    String
Library    OperatingSystem
Library    library_test

*** Variables ***
${a}    ${2}
${b}    ${3}
${resultat}    ${0}    #${${a}+${b}}

*** Keywords ***
addition des valeurs
#    ${resultat} =    Evaluate    int(${a}) + int(${b})
    ${valeur}    Evaluate    int(${a}) + int(${b})
    [Return]    ${valeur}

addition des variables ${c} et ${d}
#    ${resultat} =    Evaluate    int(${a}) + int(${b})
    ${valeur}    Evaluate    int(${c}) + int(${d})
    [Return]    ${valeur}
    
*** Test Cases ***
Test
    log to console   On est dans le test

#utilisation de la librarie custom library_test
    ${date} =    library_test.fonction_magique
    log to console    la date du jour est : ${date}

#utilisation d'une temporisation avec sleep
#    sleep    1
#   log to console    1 seconde
#    sleep    1s
#    log to console    1 seconde
#    sleep    1 second
#    log to console    1 seconde

#calculer temps d'execution
    ${secs} =     Get Time     epoch
    ${t1}    Set Variable    ${secs}
    log to console    valeure de t1 ${t1}
    sleep    2
    ${secs} =     Get Time     epoch
    ${t2}    Set Variable    ${secs}
    log to console    valeure de t2 ${t2}
    ${execution_time}    Evaluate    int(${t2})-int(${t1})
    log to console    le temps d'execution est de ${execution_time} secondes


#différentes manières de faire une somme : en direct, avec un keyword, avec un keyword contenant les variables
    #${resultat} =    Evaluate    int(${a}) + int(${b})
    log to console    ${resultat} avant le test
    #${resultat} =    addition des valeurs
    ${resultat} =    addition des variables ${a} et ${b}
    log to console    ${resultat} apres le test
    Should Be Equal    ${resultat}    ${5}    c'est pas égal à 5, dommage

    