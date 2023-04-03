source fonctions.sh
#!/bin/bash
usage()
{
echo "Aucun argument n'est passé en paramétre "
echo "Tapez sauvegarde.sh {-n | -a | -r | -s  | -h | -g | -m | -v chemin } 1 " 
}
if [ $# -eq 0 ];
then

usage;
fi
while getopts "narshgmv" option
do
case $option in
n)AfficherFichiersMod;;
a)archiver;;
r)renommerarchive;;
s)sauvegarder $2;;
h)help;;
g)menuG;;
m)menuT;;
v)version;;
esac
done
