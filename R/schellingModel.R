#APPLIQUE LE MODE DE SHELLING
one.simu<-function(seuil=3,N=100,u=1){
  M <- matrix(sample(c(0,1,2), replace = TRUE, prob = c(u,1,1), size = N^2), nrow = N)

  V<- 1:N
  G <- c(V[-1],V[1])
  D <- c(V[N],V[-N])

  i<-1
  stop<-FALSE

  while(i<=1000 & stop==FALSE)
  {

    nb1 <- (M[D,] == 1) + (M[G,] == 1) + (M[,D] == 1) + (M[,G] == 1) + (M[D,D] == 1) + (M[G,D] == 1) + (M [D,G] == 1) + (M[G,G] == 1)
    nb2 <- (M[D,] == 2) + (M[G,] == 2) + (M[,D] == 2) + (M[,G] == 2) + (M[D,D] == 2) + (M[G,D] == 2) + (M [D,G] == 2) + (M[G,G] == 2)
    #nb1, nb2 = nombre de 1 et de 2 autour de chaque case

    #A DEPLACER
    export1 <- (nb1 < seuil) & (M == 1)
    export2 <- (nb2 < seuil) & (M == 2)
    export1
    export2

    #OU DEPLACER
    import1 <- (nb1 >= seuil) & (M == 0)
    import2 <- (nb2 >= seuil) & (M == 0)
    import1
    import2


    #CHOISIR UN AGENT INSATISFAIT
    which(export1)
    which(export2)
    if( length(which(export1))==0 | length(which(export2))==0 | length(which(import1))==0 | length(which(import2))==0){
      stop<-TRUE
    }

    if(stop==FALSE){

      agent1<-sample(x=which(export1),size=1)
      agent2<-sample(x=which(export2),size=1)
      agent1
      agent2

      #CHOSIR ESPACE VACANT SATISFAISANT
      #v1<-which(import1)
      #v2<-which(import2)

      vacant1<-sample(x=which(import1),size=1)
      vacant2<-sample(x=which(import2),size=1)
      vacant1
      vacant2

      #DEMENAGEMENT
      M[agent1]<-0
      M[vacant1]<-1
      M[agent2]<-0
      M[vacant2]<-2
    }
    i<-i+1
  }
  return(M)
}


#MESURE AGREAGTION N0
two.simu<-function(M){

  V<- 1:N
  G <- c(V[-1],V[1])
  D <- c(V[N],V[-N])


  nb1 <- (M[D,] == 1) + (M[G,] == 1) + (M[,D] == 1) + (M[,G] == 1) + (M[D,D] == 1) + (M[G,D] == 1) + (M [D,G] == 1) + (M[G,G] == 1)
  nb2 <- (M[D,] == 2) + (M[G,] == 2) + (M[,D] == 2) + (M[,G] == 2) + (M[D,D] == 2) + (M[G,D] == 2) + (M [D,G] == 2) + (M[G,G] == 2)
  #nb1, nb2 = nombre de 1 et de 2 autour de chaque case
  nb1
  nb2


  N0<-0
  #parcour de la matrice,
  for(j in 1:(N*N)){

    if (M[j]==1 & nb1[j]==8){
      N0<-N0+1

    }
    if (M[j]==2 & nb2[j]==8 ){
      N0<-N0+1
    }

  }


  return (N0)
}
