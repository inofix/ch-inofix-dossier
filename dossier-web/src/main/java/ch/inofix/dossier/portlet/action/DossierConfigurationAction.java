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

}
