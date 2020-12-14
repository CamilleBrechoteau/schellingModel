# schellingModel
Application of the Schelling's Model 

ONE.SIMU

prend en parmètre :

  Seuil qui est un entier, il est préférable de qu'il soit 3,4 ou 5
  N qui est la taille des coté de la matrice utilisé comme base pour la ville
  u qui déterminera la densité d'espaces vacants, la proportion d'espace vacant correspondra à u/(u+2)
    u=1 donnera 33%, u=0.35 donnera 15% environ et u=0.04 donnera 2%
retourne : 

  La matrice après l'éxécution du modèle de Schelling sur cette matrice.
  
 
TWO.SIMU

prend en parmètre :

  M une matrice
  N qui sont la taille des côté de la matrice initialisé à 50
  
retourne :

  Mesure d'agrégation NO
  
  
 Exemple : 
      >M<-one.simu (3,50,1) #modèle de Schelling avec un seuil de 3, une matrice 50x50 et une densité de 33%
      >N0<-two.simu(M) #donne le N0 de la mtrice obtenue
