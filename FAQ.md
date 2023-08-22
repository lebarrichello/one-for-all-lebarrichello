# Dúvidas frequentes

Abaixo estão algumas orientações e dúvidas comuns ao desenvolvimento do projeto.

Se houver qualquer outra dúvida ou problema, é só procurar a monitoria ou postar uma thread no slack. Estamos juntos! 👍

## Git e GitHub

<details>
  <summary>‼️ Antes de começar a desenvolver</summary><br />

1. Clone o repositório

   - Copie o endereço SSH do repositório e use-o para cloná-lo em sua máquina:
     - Por exemplo: `git clone git@github.com:tryber/sd-0x-project-x.git`.

     <details><summary>Local do endereço SSH na página inicial do repositório:</summary>

     ![endereço SSH do repositório](images/github-ssh-repo.png)

     </details>
   - Entre na pasta do repositório que você acabou de clonar:
     - `cd <diretório-do-projeto>`

2. Crie uma branch a partir da branch `master`

   - Verifique que você está na branch `master`
     - Exemplo: `git branch`
   - Se não estiver, mude para a branch `master`
     - Exemplo: `git checkout master`
   - Agora crie uma branch à qual você vai submeter os `commits` do seu projeto
     - Você deve criar uma branch no seguinte formato: `nome-de-usuario-nome-do-projeto`
     - Exemplo: `git checkout -b joaozinho-project-x`

3. Para cada etapa do desenvolvimento, adicione as mudanças ao _stage_ do Git e faça um `commit`

   - Verifique que as mudanças ainda não estão no _stage_
     - Exemplo: `git status` (devem aparecer listadas as alterações realizadas em vermelho)
   - Adicione o novo arquivo ao _stage_ do Git
     - Exemplo:
       - `git add .` (adicionando todas as mudanças - _que estavam em vermelho_ - ao stage do Git)
       - `git status` (devem aparecer listadas as alterações realizadas em verde)
   - Faça o `commit` inicial
     - Exemplo:
       - `git commit -m 'Iniciando o projeto X! #VQV 🚀'` (fazendo o primeiro commit)
       - `git status` (deve aparecer uma mensagem tipo _nothing to commit_ )

4. Adicione a sua branch com o novo `commit` ao repositório remoto

   - Usando o exemplo anterior: `git push -u origin joaozinho-sd-0x-project-x`

5. Crie um novo `Pull Request` _(PR)_

   - Vá até a página de _Pull Requests_ do repositório no GitHub.
      <details><summary>Local da página de Pull Requests no repositório:</summary>

     ![endereço SSH do repositório](images/github-pr-open.png)

     </details>
   - Clique no botão verde _"New pull request"_
   - Clique na caixa de seleção _"Compare"_ e escolha a sua branch **com atenção**
   - Clique no botão verde _"Create pull request"_
   - Adicione uma descrição para o _Pull Request_ e clique no botão verde _"Create pull request"_
   - **Não se preocupe em preencher mais nada por enquanto!**
   - Volte até a página de _Pull Requests_ do repositório e confira que o seu _Pull Request_ está criado

</details>

<details>
  <summary>⌨️ Durante o desenvolvimento</summary><br />

- Faça `commits` das alterações que você fizer no código regularmente

- Lembre-se de sempre após um (ou alguns) `commits` atualizar o repositório remoto

- Os comandos que você utilizará com mais frequência são:
  1. `git status` _(para verificar o que está em vermelho - fora do stage - e o que está em verde - no stage)_
  2. `git add` _(para adicionar arquivos ao stage do Git)_
  3. `git commit` _(para criar um commit com os arquivos que estão no stage do Git)_
  4. `git push -u origin nome-da-branch` _(para enviar o commit para o repositório remoto na primeira vez que fizer o `push` de uma nova branch)_
  5. `git push` _(para enviar o commit para o repositório remoto após o passo anterior)_

</details>

<details>
  <summary>🤝 Depois de terminar o desenvolvimento (opcional)</summary><br />

  Para **"entregar"** seu projeto, siga os passos a seguir:

- Vá até a página **DO SEU** _Pull Request_, adicione a label de _"code-review"_ e marque seus colegas
  - No menu à direita, clique no _link_ **"Labels"** e escolha a _label_ **code-review**
  - No menu à direita, clique no _link_ **"Assignees"** e escolha **o seu usuário**
  - No menu à direita, clique no _link_ **"Reviewers"** e digite `students`, selecione o time `tryber/students-sd-xx` onde `xx` é o número da sua turma

Se ainda houver alguma dúvida sobre como entregar seu projeto [aqui tem um video explicativo](https://vimeo.com/362189205).

</details>

<details>
  <summary>🕵🏿 Revisando um pull request</summary><br />

  Use o conteúdo sobre [Code Review](https://app.betrybe.com/learn/course/5e938f69-6e32-43b3-9685-c936530fd326/module/f04cdb21-382e-4588-8950-3b1a29afd2dd/section/b3af2f05-08e5-4b4a-9667-6f5f729c351d/lesson/36268865-fc46-40c7-92bf-cbded9af9006) para te ajudar a revisar os _Pull Requests_.

</details>

## Node e NPM

<details>
<summary>⚠️ <strong>Não</strong> rode o comando <code>npm audit fix</code>!</summary><br>

- Ele atualiza várias dependências do projeto, e essa atualização gera conflitos com o avaliador.

</details>

## Rodando o projeto com Docker Compose

<details>
<summary>⚠️  Rode comandos do NPM de <strong>dentro</strong> do container Node</summary><br>

- Caso opte por utilizar o Docker, **TODOS** os comandos disponíveis no `package.json` (npm start, npm test, npm run dev, ...) devem ser executados **DENTRO** do container, ou seja, no terminal que aparece após a execução do comando `docker exec` citado acima.

</details>

<details>
<summary>⚠️ Rode comandos do Git <strong>fora</strong> do container Node</summary><br>

- O **git** dentro do container não vem configurado com suas credenciais. Ou faça os commits fora do container, ou configure as suas credenciais do git dentro do container.

</details>

<details>
<summary>⚠️ Use a versão 1.29 do Docker Compose</summary>

- Para que você consiga rodar o seu projeto com docker e o avaliador funcione é fundamental que o seu docker compose esteja na **versão 1.29**.

  - Verifique sua versão:

  ```bash
  docker-compose --version
  ```

  Se não for a versão 1.29, faça os seguintes comandos para atualizar a versão:

  ```bash
  sudo rm /usr/local/bin/docker-compose
  sudo curl -L "<https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname> -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  ```

</details>

### Dicas

<details>
<summary>✨ Desenvolvendo o projeto no VS Code de dentro do container</summary><br>

- A extensão `Dev - Containers` (que estará na seção de extensões recomendadas do VS Code) é indicada para que você possa desenvolver sua aplicação no container Docker direto no VS Code, como você faz com seus arquivos locais.

  ![Extensão Dev - Containers do VS Code](./images/dev-container.png)

</details>

## Rodando o projeto com apenas um container MySQL

<details>
<summary>⚠️ Use a versão 8.0.23 do MySQL</summary><br>

- O avaliador espera que a versão do MySQL seja a 8.0.23. Em caso de erro nos testes, verifique se essa é a versão que está sendo usada por você.

</details>

<details>
<summary>🖥️ Usando variáveis de ambientes</summary><br>

- Caso queira utilizar _Docker_ apenas para um container MySQL, basta executar o comando:

  ```sh
  docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password

  ```

  <details>
    <summary>O que está sendo feito</summary>
    <br>

    |ideia geral|Baixa e executa uma imagem _docker_ do MySQL na versão 8.0.23|
    |--|--|
    |flag `--name`|Define um nome para o nosso _container_: `mysql_8`|
    |flag `-e`|Define a variável de ambiente `MYSQL_ROOT_PASSWORD` com o valor `password`|
    |flag `-d`|Define que o container rode em segundo plano|
    |flag `-p`|Mapeia a porta local `3306` à porta `3306` do _container_, no formato `porta-local:porta-do-container`|
    |`mysql:8.0.23`|Define qual versão da imagem `mysql` queremos, no caso, a `8.0.23`, que é a esperada pelo avaliador|
    |`mysqld`|Comando a ser iniciado no container que inicia a instância do MySQL|
    |`--default-authentication-plugin=mysql_native_password`|Parâmetro passado para o comando `mysqld` que configura a forma de autenticação usada pela instância do MySQL|

  </details>

  Utilizando o comando acima, para executar os testes localmente basta digitar no terminal:

  ```sh
  MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test
  ```

</details>

## Rodando os testes do projeto

<details>
<summary>🧪 O avaliador pode testar os requisitos fora da ordem que aparecem no README</summary><br>

- O avaliador automático não necessariamente avalia seu projeto na ordem em que os requisitos aparecem no readme. Isso acontece para deixar o processo de avaliação mais rápido. Então, não se assuste se isso acontecer, ok?

</details>

<details>
<summary>🧪 Rodando os testes de forma individual</summary><br>

Você pode acrescentar ao comando `npm test` um sufixo para rodar apenas um requisito da seguinte forma: `-- -t "<número-do-requisito>"`, por exemplo:

```sh
npm test -- -t "01"
```

ou, usando variáveis de ambiente na linha de comando:

```sh
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test -- -t "01"
```

  </details>

## Depois de completar o projeto

<details>
<summary>🗂 Compartilhe seu portfólio!</summary><br />

Após finalizar os requisitos, chegou a hora de mostrar ao mundo que você aprendeu algo novo! 🚀

Siga esse [**guia que preparamos com carinho**](https://app.betrybe.com/learn/course/5e938f69-6e32-43b3-9685-c936530fd326/module/a3cac6d2-5060-445d-81f4-ea33451d8ea4/section/d4f5e97a-ca66-4e28-945d-9dd5c4282085/day/eff12025-1627-42c6-953d-238e9222c8ff/lesson/49cb103b-9e08-4ad5-af17-d423a624285a) para disponibilizar o projeto finalizado no seu GitHub pessoal.

Esse passo é super importante para ganhar mais visibilidade no mercado de trabalho, mas também é útil para manter um back-up do seu trabalho.

E você sabia que o LinkedIn é a principal rede social profissional e compartilhar o seu aprendizado lá é muito importante para quem deseja construir uma carreira de sucesso? Compartilhe esse projeto no seu LinkedIn, marque o perfil da Trybe (@trybe) e mostre para a sua rede toda a sua evolução.

</details>
