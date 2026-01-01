# Tirer parti d’un coding harness délégué : des skills, des sous-agents et des hooks, mais le budget reste à l’application

Ce dépôt est la démonstration exécutable de l'article. Il accompagne un article publié sur [sfeir.dev](https://www.sfeir.dev).

Les fichiers sont ceux que l'article imprime, extraits de son texte : rien n'a été
ajouté ici que l'article ne montre.

## Lancer la démonstration

```bash
python scripts/verify.py                      # écrit .agent/verify-record.json
echo '{"cwd": ".", "tool_input": {"command": "gh pr create --fill"}}' \
  | python3 .claude/hooks/pr_guard.py          # le hook répond, hors harnais
```

Avec Claude Code, le hook de `.claude/settings.json` est actif dès l'ouverture de
la session dans ce répertoire.

## Licence

MIT, voir `LICENSE`.
