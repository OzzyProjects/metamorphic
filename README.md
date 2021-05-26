# metamorphic

Premiers pas vers la route du code mémamorphique parfait

Le code est constitué d'une routine de crypytage et de decryptage XOR basique

TODO = la rendre metamorphique elle aussi

Pour le contenu du code, il se contente d'afficher la valeur du registre RAX à chaque boucle

Pas encore d'implementation fonctionnelle de prévue si ce n'est ajouter un algorithme complexifiant le metamorphisme

Pour le moment, en plus du cryptage il genere ou supprime des instructions NOP (vraiment très basique)

Mais suut rendre la routine de cryptage métamorphique

Generez les fichiers executables des deux fichiers separement

nasm -fbin -o header header.asm && chmod +x header

nasm -fbin -o body body.asm && chmod +x body

Puis executez le script python

python main.py

et vous avez un bel executable ELF 64 bits métamorphique sans segment corrompu ou autre normalement

Works on Linux (Ubuntu, Debian)

TODO : improve metamorphism
