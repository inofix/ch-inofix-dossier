package ch.inofix.dossier.configuration;

import aQute.bnd.annotation.metatype.Meta;

/**
 * @author Michael Lustenberger
 */
@Meta.OCD(
    id = "ch.inofix.dossier.configuration.DossierConfiguration",
    localization = "content/Language", name = "dossier.configuration.name"
)
public interface DossierConfiguration {

    @Meta.AD(deflt = "true", required = true)
    public long includeParentScope();

    @Meta.AD(deflt = "0", required = false)
    public long rootVocabularyId();

    @Meta.AD(deflt = "0", required = false)
    public long rootCategoryId();
}

