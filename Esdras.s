 .data                        #Aqui onde se cria as variaveis em Assembly
Mensagem:  .asciiz "Digite um numero\n"                     #Cria uma variável string
MensagemResul:  .asciiz "Resultado da multiplicacao e: \n"  #Cria uma variável string
num1:       .word 1                                         #Cria uma variável int
num2:       .word 1                                         #Cria uma variável int
result:    .word 1                                          #Cria uma variável int

            .text                                           #Iniciando os codigos do programa usando as variaveis criadas no .data
main: li $v0, 4                                             #Declarando a main
la $a0, Mensagem                                            #Exibe a Mensagem na tela
syscall                                                     #Chama o sistema

li $v0, 5                                                   #Lê um inteiro
syscall                                                     #Chama o sistema
sw $v0, num1                                                #Joga na variavel o que o usuario digitou

li $v0, 4                                                   #Printa na tela
la $a0, Mensagem                                            #Exibe a Mensagem na tela
syscall                                                     #Chama o sistema

li $v0, 5                                                   #Lê um inteiro
syscall                                                     #Chama o sistema
sw $v0, num2                                                #Atribui valor do registrador para um endereco de memoria

lw $s0, num1($zero)                                         #Atribui valor puxado da memoria a um registrador
lw $s1, num2($zero)                                         #Atribui valor puxado da memoria a um registrador

li $v0, 4                                                   #Printa na tela
la $a0, MensagemResul                                       #Exibe a Mensagem na tela
syscall                                                     #Chama o sistema 
mul $t0, $s0, $s1                                           #multiplica o n1 pelo n2 e joga para um registrador temporario
sw $t0, result                                              #Joga na variavel result o valor do temporario

li $v0, 1                                                   #Le um inteiro
move $a0, $t0                                               #Exibe o resultado na tela
syscall                                                     #Chama o sistema

jr $ra                                                      #Retorna a funcao