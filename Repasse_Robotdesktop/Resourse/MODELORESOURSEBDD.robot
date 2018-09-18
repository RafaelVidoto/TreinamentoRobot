*** Settings ***
Library   SikuliLibrary              #instancio a biblioteca do Sikuli
Library   AutoItLibrary              #instancio a biblioteca do AutoIt
Library   Process                    #instancio a biblioteca Process, ela é nativa


*** Variables ***
${IMAGEM_DIR}            ${CURDIR}/imagem          # seto meu diretorio de imagens em uma variavel 
&{SISTEMA}               ScriptTest=C:\\Users\\rafael.azevedo\\Desktop\\ScriptTest.exe                #seto o local do meu exe em uma variavel 
${Lotacao}               Distribuidor
${Usuario}               Softplan
${Senha}                 agesune1
${Versao}                02.00.00.00
${Base}                  SG5TINT
${Observação}            Na minha maquina funciona
#${Observação}            erro 
${CasodeTeste}           Robot Framework
${ResuktadoEsperado}     Sistema funcionar
${Evidências}            Sem evidências 


*** Keywords ***

#SETUP e TEARDOW
Inicia o ambiente para teste
       add Image Path   ${IMAGEM_DIR}     #carrego meu diretório de imagens (Processo necessário apenas no uso do Sikuli)

Finaliza o Sistema
    Win Kill      strTitle=Sem título - Bloco de notas   strText=${EMPTY} 
    sleep         2s
    Win Kill      strTitle=ScriptTest   strText=${EMPTY} 



     

#BDD
DADO QUE o aplicativo seja executado
            Start Process      ${SISTEMA.ScriptTest}  #Uso a Keyword Start Process da Library Process  para abrir meu exe 
E o usuário acesse a aba Fechamento de TEST
            Click               abafechamentoTEST     #Uso a Keyword Click da Sikuli para clicar na imagem que printei
E o usuário escolha a opção Reprovado
            #Click               radiobutton_reprovado   #Uso a Keyword Click da Sikuli para clicar na imagem que printei
            Control Click        ScriptTest       REPROVADO       WindowsForms10.BUTTON.app.0.141b42a_r9_ad17   #msm ação com autoit
            Sleep                3s
E o usuário prencha os dados no formulario
            Click                combo_sistema
            Click                label_ADMSG5
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad117        ${Lotacao}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad115        ${Usuario}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad114        ${Senha}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad118        ${Versao}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad113        ${Base}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad116        ${Observação} 
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad112        ${CasodeTeste}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad111        ${ResuktadoEsperado}
            Control Send         ScriptTest       ${EMPTY}      WindowsForms10.EDIT.app.0.141b42a_r9_ad110        ${Evidências}
QUANDO o usuário clicar no botão copiar
            Control Click        ScriptTest       Copiar         WindowsForms10.BUTTON.app.0.141b42a_r9_ad14  
E o bloco de notas for iniciado 
             Sleep                5s
             Send                 ^+N                 #Tecla de atalho CTRL+SHIFT+N abre o meu bloco de notas
             Wait Until Screen Contain                 tela_blocodenotas                    10        #aguardar a tela do bloco de notas abrir
             Send                  ^V     
ENTÃO a tela deve conter             
             Screen Should Contain                   validacaoteste1           #Validacao Sikulli o que deve conter na tela
             Sleep                 5s
         
               
                            




            

              
            
          
            
            
             
             
            
                        

                        
               

