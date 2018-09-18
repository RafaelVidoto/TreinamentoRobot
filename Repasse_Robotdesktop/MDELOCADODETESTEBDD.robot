*** Settings ***
Resource             ./Resourse/MODELORESOURSEBDD.robot      
Suite Setup          Inicia o ambiente para teste
Suite Teardown       Finaliza o Sistema   




*** Test Cases ***

Cenário 1: Digitação formulário
       DADO QUE o aplicativo seja executado
       E o usuário acesse a aba Fechamento de TEST
       E o usuário escolha a opção Reprovado
       E o usuário prencha os dados no formulario
       QUANDO o usuário clicar no botão copiar
       E o bloco de notas for iniciado 
       ENTÃO a tela deve conter  
