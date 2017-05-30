#!/bin/bash

branch=demanda/logistica/remanejamento

git checkout master
git fetch -p
git pull
#git remote add origin http://m.pivetta:gravedigger@tfs.dc.sbnet/tfs/Centauro/Retail%20Offline/_git/sispac

git checkout $branch
#cria array com os arquivos alterados na branch
arquivos=( $(git diff --name-only $branch master) )

dir=remanejamento
if [ ! -d "$dir" ]; then
	mkdir $dir
fi

#imprime o nome dos arquivos
for arquivo in "${arquivos[@]}"; do 
	echo $arquivo
done

cd $dir

#imprime o nome dos arquivos
for arquivo in "${arquivos[@]}"; do
	if [[ ../$arquivo == *.4gl ]]; then
 		fgl2p ../$arquivo
 	elif [[ ../$arquivo == *.per ]]; then
 		fglform ../$arquivo
 		mv ../$arquivo .
	fi 
	
done