# SMOOTH_MANIFEST.md

## Projet
- Nom: gabo
- Type: jeu (probablement mobile/desktop)
- Client: Smooth & Design (interne — projet open source)
- Statut: archive

## Stack
- Frontend: Non déterminé (fichiers .dmb, .rsc, .int, .lk ignorés — possiblement un moteur de jeu propriétaire ou GameMaker)
- Backend: N/A
- Auth: N/A
- Base de données: N/A
- Autres: Licence GPL-3.0

## Features implémentées
- Version digitale du jeu de cartes Gabo
- Jeu de mémoire et de réflexes
- Projet open source avec appel aux contributions

## Patterns notables
- Architecture: Repo contient seulement README, LICENSE et .gitignore (les assets binaires sont ignorés via .gitignore)
- Collections Firestore / tables Supabase: Aucune
- Conventions de nommage: Extensions de fichiers spécifiques au moteur de jeu (.dmb, .rsc, .int, .lk)

## Réutilisabilité
- Snippets clés: Concept de jeu de cartes digitalisé — logique de jeu potentiellement réutilisable pour d'autres jeux de cartes
