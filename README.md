# Apple-Weather-App-Clone
Apple Weather App Clone

Il s'agit d'un exercice dont le but etait de reproduire l'application Meteo Apple installee par defaut.

Voici comment j'ai procede :
- le nom de la ville est recupere grace a un Geocoder.reverse (c'est beaucoup plus precis)
- les temperatures, informations, icones sont recuperes grace a une API. En l'occurence sur https://openweathermap.org
- la table View contient deux Prototypes cell : La premiere est une collection view horizontale, la deuxieme est une cell classique avec des labels et une Image View
- les requetes pour recuperer les donnees sous format JSON sont faite via Alamofire.

Voici une capture d'ecran :

Premiere version de l'application terminee le samedi 6 Juillet 2019.
Application non publiee sur l'App Store.
Copyright © 2019 Saliou DJALO. All rights reserved.

