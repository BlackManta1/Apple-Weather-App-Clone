# Apple-Weather-App-Clone
Apple Weather App Clone

Il s'agit d'un exercice dont le but etait de reproduire l'application Meteo Apple installee par defaut.

Voici comment j'ai procede :
- le nom de la ville est recupere grace a un Geocoder.reverse (c'est beaucoup plus precis)
- les temperatures, informations, icones sont recuperes grace a une API. En l'occurence sur [Openweathermap.org](https://openweathermap.org)
- la table View contient deux Prototypes cell : La premiere est une collection view horizontale, la deuxieme est une cell classique avec des labels et une Image View
- les requetes pour recuperer les donnees sous format JSON sont faite via Alamofire.
- le projet a ete realise selon la methode Model - View - Controller
- La seule autorisation demande dans le info.plist est : Privacy - Location When In Use Usage Description

Voici une capture d'ecran :
![IMG_E0B870A325CE-1](https://user-images.githubusercontent.com/46055179/60755642-7c2a3e00-a003-11e9-9148-6ae27279e91e.jpeg)

Premiere version de l'application terminee le samedi 6 Juillet 2019.
Application non publiee sur l'App Store.

###### Copyright © 2019 Saliou DJALO. All rights reserved.

