      **************************************************************
      *    PROGRAMME DateMng                                       *
      *    Ce programme démontre l'utilisation de différentes      *
      *    instructions MOVE pour manipuler des dates. Il convertit*
      *    une date du format MM-JJ-AAAA au format français        *
      *    JJ/MM/AAAA, affiche la date actuelle dans le même format*
      *    et indique la date et l'heure de compilation.           *
      *************************************************************
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DateMng.
       AUTHOR. Pierre.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      
      *    Variable pour l'entrée de l'utilisateur.
       01 WS-DATE-US-INPUT            PIC X(10).
      
      *    Structures pour les formats de date.
       01 WS-DATE-US.
           05 WS-MONTH-US              PIC 9(02).
           05 WS-DAY-US                PIC 9(02).
           05 WS-YEAR-US               PIC 9(04).
       01 WS-DATE-FR.
           05 WS-DAY-FR                PIC 9(02).
           05 WS-MONTH-FR              PIC 9(02).
           05 WS-YEAR-FR               PIC 9(04).
      
      *    Structure pour la date actuelle.
       01 SYS-DATE8.
           03 A4.
              05 SS  PIC 99.
              05 AA  PIC 99.
           03 MM  PIC 99.
           03 JJ    PIC 99.
      
      *    Variable pour la date de compilation.
       01 WS-COMPILE-DATE              PIC X(10)   VALUE '10-04-2024'.
       01 WS-COMPILE-TIME              PIC X(08)   VALUE '15:00:00'.
      
       PROCEDURE DIVISION.
      
      *    Point d'entrée principal du programme.
       1000-MAIN.
           DISPLAY "Entrez une date au format "
      -            "MM-JJ-AAAA:" SPACE WITH NO ADVANCING.
           ACCEPT WS-DATE-US-INPUT.
      
      *    Convertir et afficher la date saisie au format français.
           UNSTRING WS-DATE-US-INPUT DELIMITED BY "-"
               INTO WS-MONTH-US, WS-DAY-US, WS-YEAR-US
           MOVE WS-DAY-US TO WS-DAY-FR
           MOVE WS-MONTH-US TO WS-MONTH-FR
           MOVE WS-YEAR-US TO WS-YEAR-FR
           DISPLAY "Date convertie au format français: "
               WS-DAY-FR "/" WS-MONTH-FR "/" WS-YEAR-FR.
      
      *    Récupérer et afficher la date actuelle en format français.
           ACCEPT SYS-DATE8 FROM DATE YYYYMMDD.
           DISPLAY "Date actuelle (format français): "
               JJ "/" MM "/" AA.
      
      *    Afficher la date et l'heure de compilation.
           DISPLAY "Date et heure de compilation (format français): "
               WHEN-COMPILED
      
           STOP RUN.
