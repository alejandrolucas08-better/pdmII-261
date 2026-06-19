# Avaliacao 09 - Consumo de API REST com Flutter

## API utilizada

O projeto consome a API publica JSONPlaceholder:

```text
https://jsonplaceholder.typicode.com/posts
```

Cada post exibe pelo menos tres informacoes:

- titulo;
- corpo da publicacao;
- identificador do usuario;
- identificador do post.

## Arquitetura

```text
lib/
+-- main.dart
+-- models/
|   +-- item.dart
+-- services/
|   +-- api_service.dart
+-- screens/
|   +-- home_screen.dart
+-- widgets/
    +-- item_card.dart
web/
+-- index.html
+-- manifest.json
```

- `models/item.dart`: representa os dados retornados pela API e implementa `fromJson()`.
- `services/api_service.dart`: centraliza a requisicao HTTP GET e o tratamento basico de erros.
- `screens/home_screen.dart`: controla o estado da tela com `setState`, busca os dados ao iniciar e implementa pull-to-refresh.
- `widgets/item_card.dart`: componente visual reutilizavel para exibir cada item em um `Card`.

## Funcionalidades

- busca automatica dos dados ao abrir o aplicativo;
- indicador de carregamento com `CircularProgressIndicator`;
- lista dinamica com `ListView.builder`;
- apresentacao dos dados em `Cards`;
- mensagens amigaveis para erros de conexao ou resposta inesperada;
- botao para tentar novamente;
- atualizacao da lista com `RefreshIndicator`.

## Dependencias

A dependencia externa principal esta no `pubspec.yaml`:

```yaml
dependencies:
  http: ^1.2.2
```

## Como executar

1. Abra a pasta do projeto.
2. Instale as dependencias:

```bash
flutter pub get
```

3. Execute o aplicativo:

```bash
flutter run
```

4. Para executar no navegador, use:

```bash
flutter run -d chrome
```

5. Para Android, iOS ou desktop, gere as pastas da plataforma caso elas ainda nao existam:

```bash
flutter create .
```

