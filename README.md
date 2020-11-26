# Alya-me

Alya significa “sublime”, “alta”, “grandiosa” cujo é um nome de uma estrela que é pertencente a constelação Serpens. 
O nome do aplicativo brinca com o nome da estrela com a pronúncia de Alia, que vem de aliança. 

"Alio-me", é uma aplicação voltada a saúde e bem estar do usuário ou usuária da aplicação. Nada melhor que uma grande aliança com o próprio eu, certo? 

Em meio ao período pandêmico que estamos vivenciando nos últimos meses é de suma importância o cuidado consigo mesmo, é necessário que a divisão do tempo e da sua rotina tenha tempo reservado para seu cuidado.
E este é o principal foco do Alya-me, cuidar de você mesmo!  

## Visão geral sobre o APP

O aplicativo dispõe das seguintes funcionalidades: 

Cantinho do pensamento / About Me: O cantinho do pensamento é um lugar reservado apenas para você digitar o que sente de forma contínua. Pode ser um pensamento, uma anotação qualquer, algo que vem mapeando ou simplesmente algo que precisa!
O cantinho é reservado com suas anotações e você pode checar quando quiser. Especialistas sugerem que escreva seus pensamentos para esclarecer ideias que leva consigo. É um ótimo método para transparecer ideias tornando em algo visível e que não pode ser embaralhado por sua mente facilmente.
Ah! Fique à vontade para deletar ou consultar quando quiser.

Obtenha a sorte diária / Get a Luck: O Get a Luck é uma aba com diversas frases motivacionais e criticas para reflexão. Basta rolar e pausar para tirar a do dia.

Imagem de filhotes fofinhos / Good Baby: Filhotes de animais são algo que gera uma explosão de sentimento positivo muita das vezes em nós. Fique a vontade para consultar uma fofurinha sempre que quiser. 

Lugares requisitados para uma viagem solo / To Go: Lugares aconchegantes para uma futura viagem! 

Músicas para ouvir durante sua visita no app (isso mesmo!) / Good Songs: O aplicativo possui uma playlist com as músicas dos momentos com seus variados gêneros que possibilita que você ouça enquanto manuseia o aplicativo livremente. 

## Quesitos técnicos

O app agora salva automaticamente (persiste) todo o conteúdo sobre você em um arquivo JSON (JavaScript Object Notation), que é lido durante a inicialização do app. Ou seja, os itens da lista não são perdidos depois que o app é fechado.

Possui a opção de escolha entre os temas Light e Dark para o app, o aplicativo permite em um tema claro e outro escuro.

Em quesito técnico, o app passou a ser organizado através do gerenciamento dos dados usando SQLite (através do package Floor) e gerenciamento dos estados do app (através do package MobX).
É organizado seguindo o padrão Model–view–controller (MVC). Com isso, o APP foi divido nas seguintes camadas:

* Model: Contendo a classe Item com seus atributos: nome, preço e quem é o responsável, funções que transformam a instância da classe em um objeto JSON e vice-versa;
* View: Contendo a classe View onde estão todos os métodos de layout e design do app;
* Controller: Contendo a classe Controlle, que controla o fluxo dos dados, possuindo as funções de insert, update e delete (CRUD);
* Repository: Contendo a classe Repository, onde ficam os métodos que envolvem o acesso direto ao banco de dados / armazenamento de dados (JSON na programação atual).

Espero que goste!  
