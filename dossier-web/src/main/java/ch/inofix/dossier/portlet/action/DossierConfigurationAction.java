package ch.inofix.dossier.portlet.action;

import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletPreferences;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.service.component.annotations.Activate;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.ConfigurationPolicy;
import org.osgi.service.component.annotations.Modified;

import com.liferay.portal.configuration.metatype.bnd.util.ConfigurableUtil;
import com.liferay.portal.kernel.portlet.ConfigurationAction;
import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;
import com.liferay.portal.kernel.util.ParamUtil;

import ch.inofix.dossier.constants.DossierPortletKeys;
import ch.inofix.dossier.configuration.DossierConfiguration;

/**
 * author Michael Lustenberger
 */

@Component(
    configurationPid = "ch.inofix.dossier.configuration.DossierConfiguration",
    configurationPolicy = ConfigurationPolicy.OPTIONAL,
    immediate = true,
    property = {"javax.portlet.name=" + DossierPortletKeys.DOSSIER},
    service = ConfigurationAction.class
)

public class DossierConfigurationAction extends DefaultConfigurationAction {

    @Override
    public void processAction(PortletConfig portletConfig, ActionRequest
            actionRequest, ActionResponse actionResponse) throws Exception {

        Boolean doIncludeParentScope = ParamUtil.getBoolean(actionRequest, "doIncludeParentScope");
        Long rootVocabularyId = ParamUtil.getLong(actionRequest, "rootVocabularyId");
        Long rootCategoryId = ParamUtil.getLong(actionRequest, "rootCategoryId");

        PortletPreferences preferences = actionRequest.getPreferences();
        preferences.setValue("doIncludeParentScope", String.valueOf(doIncludeParentScope));
        preferences.setValue("rootVocabularyId", String.valueOf(rootVocabularyId));
        preferences.setValue("rootCategoryId", String.valueOf(rootCategoryId));

        super.processAction(portletConfig, actionRequest, actionResponse);
    }

    @Override
    public void include(PortletConfig portletConfig, HttpServletRequest httpServletRequest,
            HttpServletResponse httpServletResponse) throws Exception {

        httpServletRequest.setAttribute(DossierConfiguration.class.getName(), _dossierConfiguration);

        super.include(portletConfig, httpServletRequest, httpServletResponse);
    }

    @Activate
    @Modified
    protected void activate(Map<Object, Object> properties) {

        _dossierConfiguration = ConfigurableUtil.createConfigurable(
            DossierConfiguration.class, properties);
    }

    private volatile DossierConfiguration _dossierConfiguration;
}

