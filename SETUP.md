    cd workspace/project/modules/
    git clone gitrepo
    cd ..

* Create the web portlet
 * init
    blade create -t mvc-portlet -p ch.inofix.dossier -C Dossier dossier-web
    mv modules/dossier-web modules/gitrepo
 * later added es/npm support
  * create package.json (add to VCS)
    {
        "name": "dossier-web",
        "version": "1.0.0"
    }
  * install the bundler (add package\*.json to VCS)
    cd src/main/resources/META-INF/resources/
    npm install --save-dev liferay-npm-bundler

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
