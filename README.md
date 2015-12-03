# gac

## Autenticação com credenciais Google

A aplicação utiliza as credenciais Google do usuário, a mesma utilizada para o email. Para o cadastro e futuros acessos, escolha a opção para usar a conta Google.

**Importante:** somente emails do domínio *thoughtworks.com* estão permitidos para serem usados.

### Configuração do sistema de autenticação

Para que o sistema de autenticação funcione apropriadamente, após a primeira migração de banco de dados, siga os passos abaixo utilizando o painel de administração do Django:
1. Adicione um Site para o seu domínio, respeitando o mesmo settings.SITE_ID (django.contrib.sites app).
2. Para cada OAuth provider adicione um Social App (socialaccount app).

Para mais informações, acesse a documentação de [instalação](http://django-allauth.readthedocs.org/en/latest/installation.html "Instalação do Django Allauth") e [configuração](http://django-allauth.readthedocs.org/en/latest/configuration.html "Configuração do Django Allauth") da biblioteca [django-allauth](http://django-allauth.readthedocs.org/en/latest/ "Django Allauth").

## Configuração do ambiente de desenvolvimento

Definimos uma máquina virtual configurada com Vagrant para ser utilizada como
ambiente de desenvolvimento. Para iniciá-la:

1. Instalar VirtualBox
2. Instalar Vagrant
3. Executar 'vagrant up' na raiz do projeto (demora um pouco)
4. Executar 'vagrant ssh' para acessar a máquina virtual

### EditorConfig

Com o intuito de otimizar a formatação do código esse projeto utiliza o editor
config. Para usar basta baixar e instalar o plugin para o seu editor de texto
preferido em [editorconfig.org](http://editorconfig.org "Site do editor config")
