#!/bin/bash
AfficherFichiersMod()
{
mkdir tmp
find . -mtime -1 | wc -l
find . -mtime -1 -exec cp {} tmp \;
du -sh tmp
rm -r tmp
}
archiver()
{
find -mtime -1 -exec tar -rvf *.tar.gz {} \;

}
renommerarchive()
{
stat -c %y *.tar.gz > tmp
nom=`cut -d' ' -f1 tmp`

mv *.tar.gz $nom.tar.gz
}
sauvegarder()
{

tar -tvf *.tar.gz > $1


}

help()
{
cat help.txt
}
menuG()
{
GTK_THEME="Adwaita-dark" yad --width 630 --height 220 --button="Help:1" --button="renommer:2" --center --button="menutextuelle:3" --buttons-layout=spread 
choix=$?
[[ $choix -eq 1 ]] && help
[[ $choix -eq 2 ]] && renommer
[[ $choix -eq 3 ]] && menuT
}
version()
{
echo "Realisé par Amal , Amina";
echo "V1.2";
}
menuT()
{
PS3="Votre Choix : "
select item in "-menu graphique-" "-renommer-" "-help-" "-Exit-"
do
echo "Vous avez choisi l'item $REPLY : $item"
case $REPLY in
1)menuG;;
2)renommerarchive;;
3)help;;
4)exit 0;;
esac
done
}
