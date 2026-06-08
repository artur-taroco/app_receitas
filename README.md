# App de Receitas

Aplicativo desenvolvido em Flutter para a disciplina de Sistemas Móveis.

## Sobre o Projeto

O App de Receitas permite que os usuários pesquisem receitas utilizando uma API REST pública, visualizem detalhes completos de cada receita e salvem suas favoritas localmente no dispositivo.

O projeto foi desenvolvido com Flutter utilizando conceitos fundamentais de desenvolvimento mobile, como navegação entre telas, gerenciamento de estado, consumo de APIs e persistência de dados.

## Funcionalidades

- Pesquisa de receitas
- Consumo de API REST
- Exibição de imagem, categoria e modo de preparo
- Navegação entre telas
- Passagem de parâmetros entre telas
- Sistema de favoritos
- Armazenamento local com SharedPreferences
- Interface baseada em Material Design
- Navegação principal com BottomNavigationBar

## Telas do Aplicativo

### Home

- Pesquisa de receitas
- Lista de receitas retornadas pela API

### Detalhes

- Imagem da receita
- Categoria
- Modo de preparo
- Botão para adicionar aos favoritos

### Favoritos

- Lista de receitas salvas localmente
- Remoção de favoritos

### Sobre

- Informações do projeto
- Informações dos integrantes

## Tecnologias Utilizadas

- Flutter
- Dart
- Material Design 3

### Bibliotecas Utilizadas

- http
- shared_preferences
- cached_network_image

## API Utilizada

### TheMealDB

API pública utilizada para busca de receitas.

https://www.themealdb.com/api.php

Exemplo de endpoint utilizado:

```http
https://www.themealdb.com/api/json/v1/1/search.php?s=chicken
```

## Estrutura do Projeto

```text
lib/
│
├── models/
│   └── recipe.dart
│
├── services/
│   ├── meal_api_service.dart
│   └── favorites_service.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── details_screen.dart
│   ├── favorites_screen.dart
│   └── about_screen.dart
│
├── navigation/
│   └── bottom_nav.dart
│
└── main.dart
```

## Como Executar

### 1. Clonar o repositório

```bash
git clone https://github.com/artur-taroco/app_receitas.git
```

### 2. Entrar na pasta do projeto

```bash
cd app_receitas
```

### 3. Instalar dependências

```bash
flutter pub get
```

### 4. Executar o projeto

```bash
flutter run
```

## Requisitos da Atividade Atendidos

### Navegação entre telas

- Home
- Detalhes
- Favoritos
- Sobre

### Passagem de parâmetros

- Objeto `Recipe` enviado para a tela de detalhes

### API REST

- Consumo da API TheMealDB

### StatefulWidget

- HomeScreen
- FavoritesScreen

### Componente obrigatório

- BottomNavigationBar

### Bibliotecas do Pub.dev

- http
- shared_preferences
- cached_network_image

### Componentes em arquivos separados

- Implementado

## Integrante

Artur Taroco

## Disciplina

Sistemas Móveis

## Projeto Acadêmico

Projeto desenvolvido como trabalho final da disciplina de Sistemas Móveis utilizando Flutter.
