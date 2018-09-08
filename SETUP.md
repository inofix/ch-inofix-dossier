    cd workspace/project/modules/
    git clone gitrepo
    cd ..

    blade create -t mvc-portlet -p ch.inofix.dossier -C Dossier dossier-web
    mv modules/dossier-web modules/gitrepo

    blade create -t service-builder -p ch.inofix.dossier dossier
    mv modules/dossier/* modules/gitrepo

