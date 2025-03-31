### PING STATUS HOST

## EXECUTANDO:
Para executar o script requer que ele esteja executável.
    # deixe o arquivo executável com:
    chmod +x main.sh

    # execute com:
    ./main.sh

OBS.: O script vai criar um arquivo hosts.csv automaticamente caso ele não seja localizado no diretório.

## CONFIGURANDO AS VARIAVEIS:
No arquivo main.sh existe duas variáveis que podem ser redefinidas, que é o limite de tempo de resposta e o tempo de espera para atualizar o status do host. 

## CONFIGURANDO O ARQUIVO HOSTS.CSV:
"hosts.csv" é o arquivo que fica os nomes e ips dos hosts que serão verificados se estão online.
podemos definir o nome do host e ip dessa forma: "Nome do host;IP".
#exemplo:

    Computador 01;192.168.0.10
    Computador 02;192.168.0.11
    TV Smart 01;192.168.0.20
    Computador 03;192.168.0.12
    Computador 04;192.168.0.13
    TV Smart 02;192.168.0.21

nesse arquivo também é possivel agrupar os hosts. Basta digitar "##TITLE##;Nome do grupo" acima do grupo de hosts..
exemplo:

    ##TITLE##;Laboratorio 01
    Computador 01;192.168.0.10
    Computador 02;192.168.0.11
    TV Smart 01;192.168.0.20
    ##TITLE##;Laboratorio 02
    Computador 01;192.168.0.12
    Computador 02;192.168.0.13
    TV Smart 01;192.168.0.21

OBS.: Nesse arquivo não pode deixar linhas em branco.
