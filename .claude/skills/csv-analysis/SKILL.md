---
name: csv-analysis
description: Analyse un fichier CSV trop volumineux pour être lu en entier, comme un export de tickets ou un journal. À utiliser pour toute question sur un CSV de plus de quelques milliers de lignes.
---

Ne lis jamais un gros CSV avec l’outil de lecture de fichiers : il ne tient pas dans le contexte.

1. Affiche l’en-tête et deux lignes avec `head -n 3 <fichier>` pour connaître les colonnes.
2. Compte les lignes par valeur d’une colonne avec `python3 .claude/skills/csv-analysis/scripts/count_by.py <fichier> <colonne>`.
3. Réponds à partir de la sortie du script, en donnant le nombre de lignes lues.
