
*** Test Cases ***
Should detect a Quadrangle when 4 sides have sides 3 3 3 4
    ${result} =  Run Java Class With Args  ${mainClass}   3 3 3 4
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can create figure : Quadrangle

Should detect a triangle when 3 sides are equal
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 2
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can create figure : Triangle Can create figure : EquilateralTriangle Can create figure : IsoscelesTriangle

Should detect a triangle when sides are 2 2 3
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 3
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can create figure : IsoscelesTriangle

Should return information that creating figures is not passable when pointing 5 arguments
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 3 2 2
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can not create figure

Should return information that creating figures is not passable when pointing 2 arguments
    ${result} =  Run Java Class With Args  ${mainClass}   2 2
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can not create figure

Should not detect a figure when sides are 1 5 9
    ${result} =  Run Java Class With Args  ${mainClass}   2 2
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can not create figure

Should detect a figure when sides are 4 4 4 4
    ${result} =  Run Java Class With Args  ${mainClass}   2 2
    Should be equal as strings     ${result.replace("\n", " ")}   Can you build figure form sides? Can create figure : Square Can create figure : Rectangle Can create figure : Quadrangle

*** Settings ***
Documentation   Test figures
Library         OperatingSystem

*** Variables ***
${SRC_PATH}    %{user.dir}\\target\\classes\\
${mainClass}    pl.edu.pja.tau.lab6.App

*** Keywords ***
Check Path
    [Arguments]  ${class_name}  ${output}=${SRC_PATH}${class_name}
    Log     Running: ${output}
    [return]    ${output}

Run Java Class
    [Arguments]  ${class_name}  ${path}=${SRC_PATH}
    ${output}=   Run    java -cp ${path} ${class_name}
    Log     ${output}
   [return]    ${output}

Run Java Class With Args
    [Arguments]  ${class_name}  ${args}     ${path}=${SRC_PATH}
    ${output}=   Run    java -cp ${path} ${class_name} ${args}
    Log     ${output}
    [return]    ${output}
