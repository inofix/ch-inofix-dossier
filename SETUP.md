    cd workspace/project/modules/
    git clone gitrepo
    cd ..

* Create the web portlet
    blade create -t mvc-portlet -p ch.inofix.dossier -C Dossier dossier-web
    mv modules/dossier-web modules/gitrepo

* Create the backend portlet (service and api)
    blade create -t service-builder -p ch.inofix.dossier dossier
    mv modules/dossier/* modules/gitrepo

* Add the gradle build tool
 * Add the wrapper task in `build.gradle`
    task wrapper(type: Wrapper) { <..> }
 * Create it
    gradle wrapper
 * Now we can build the liferay services
    ./gradlew buildService
