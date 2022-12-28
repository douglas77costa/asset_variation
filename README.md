# Variação de ativos Bitcoin
Essa é uma aplicação feita em Flutter que mostra os 30 últimos pregões do Bitcoin em USD, utiliza a API do Yahoo Finance para retornas os dados necessários através de uma outra API feita em .NET core.

## Como começar

- Utilizar versão do Flutter 3.3.10
- Para excutar aplicação com backend local, é necessário clonar o repositório [AssetVariationApi](https://github.com/douglas77costa/AssetVariationApi "AssetVariationApi") (mais detalhes no repositório) e depois apontar o IP da maquina local que está executando a aplicação no arquivo [api_base.dart](https://github.com/douglas77costa/asset_variation/blob/main/lib/app/core/shared/utils/api_base.dart "api_base.dart"), nesse arquivo alterar a variável "[localUrl](https://github.com/douglas77costa/asset_variation/blob/75be9077c5b5de4cf2838bffeb84404e28b3529c/lib/app/core/shared/utils/api_base.dart#L2 "localUrl")" com o endereço IP, alterando também a variável "[isLocal](https://github.com/douglas77costa/asset_variation/blob/75be9077c5b5de4cf2838bffeb84404e28b3529c/lib/app/core/shared/utils/api_base.dart#L6 "isLocal")" para true, não esqueça de manter o sufixo "/api" na url. Caso tenha algum problema para rodar o backend localmente, fiz o deploy do mesmo para o Azure, nesse caso não é necessário nenhuma alteração pois a variável "[defaultUrl](https://github.com/douglas77costa/asset_variation/blob/75be9077c5b5de4cf2838bffeb84404e28b3529c/lib/app/core/shared/utils/api_base.dart#L3 "defaultUrl")" já está apontando corretamente para API desenvolvida. Também há um anexo na raiz do repositório com o apk da aplicação "app.apk" pronto para ser instalado e utilizado.

## Tecnologia e Ferramentas
Em resumo as ferramentas e tecnologias utilizadas foram:
- Figma para prototipação das telas a serem desenvolvidas utilizando os princípios do Material Design, protótipo pode ser encontrado [aqui](https://www.figma.com/file/APKOUyIJdRwxJDqGYpvtb9/Prot%C3%B3tipo-Ativos-BTC?node-id=0%3A1&t=I5YC0xnAYVMYzgZL-1 "aqui")
- Clean Dart, uma proposta de arquitetura limpa voltada para o Flutter.
- GetX como gerenciador de estado, rotas e client http.
- Syncfusion Charts e Sycfusion DataGrid para tabela de ativos e gráfico.
- Json serializable para manipulação dos dados json vindos da API.
