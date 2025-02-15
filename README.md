# DATASCIENTEST WEB SERVER
Vous êtes libre de choisir l’application, voici quelques exemples : 

Services Web
L’idée de ce projet est de reprendre les livrables de votre examen Linux c’est à dire : 


2 serveurs Web (Apache ou NGINX)
Avec leurs CMS respectifs (Wordpress, Prestashop, Magento...)
Et son Load Balancer
 
Et de faire évoluer cette solution pour la déployer dans Kubernetes. On pourra se servir d’un provider Cloud comme AWS pour déployer l’application.
Cette application pourra évoluer au fur et à mesure de votre avancement lors de la formation : 


Construire les Dockerfiles pour chaque composant de l’application

Déployer cette application dans un environnement de test et s’assurer qu’elle fonctionne. On pourra créer des simples tests unitaires pour s’en assurer

Orchestrer ces conteneurs via Kubernetes

Automatiser le déploiement et les changements via un pipeline (Codepipeline, GitHub Actions, GitLab CI, Jenkins…)

 Créer des templates IaC (Infrastructure As Code) pour déployer l’infrastructure de manière automatisée

Déployer la solution en production

# Première étape: déploiement via Docker-compose
docker-compose up -d

# Seconde étape: déploiement via helm
helm install web-server-project kubernetes_helm/ -n test

