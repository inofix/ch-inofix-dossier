<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/asset" prefix="liferay-asset" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ddm" prefix="liferay-ddm" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%@ page import="ch.inofix.dossier.configuration.DossierConfiguration" %>

<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>
<%@ page import="com.liferay.asset.kernel.model.AssetCategory" %>
<%@ page import="com.liferay.asset.kernel.model.AssetVocabulary" %>
<%@ page import="com.liferay.asset.kernel.service.AssetVocabularyServiceUtil" %>
<%@ page import="com.liferay.portal.kernel.util.Constants" %>

<%@ page import="com.liferay.portal.kernel.portlet.PortalPreferences" %>
<%@ page import="com.liferay.portal.kernel.portlet.PortletPreferencesFactoryUtil" %>

<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>

<%@ page import="com.liferay.portal.kernel.util.Validator" %>

<%@ page import="javax.portlet.PortletPreferences" %>
<%@ page import="javax.portlet.PortletURL" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<%
    PortalPreferences portalPreferences = PortletPreferencesFactoryUtil
                                    .getPortalPreferences(request);

    boolean doIncludeParentScope = GetterUtil.getBoolean(portletPreferences
                            .getValue("doIncludeParentScope", "true"));
    long rootVocabularyId = GetterUtil.getLong(portletPreferences
                            .getValue("rootVocabularyId", "0"));
    long rootCategoryId = GetterUtil.getLong(portletPreferences
                            .getValue("rootCategoryId", "0"));

    DossierConfiguration dossierConfiguration =
            (DossierConfiguration) request.getAttribute(
                DossierConfiguration.class.getName());

    if (Validator.isNotNull(dossierConfiguration)) {
        doIncludeParentScope = GetterUtil.getBoolean(
                portletPreferences.getValue("doIncludeParentScope",
                String.valueOf(dossierConfiguration.doIncludeParentScope())));
        rootVocabularyId = GetterUtil.getLong(
                portletPreferences.getValue("rootVocabularyId",
                String.valueOf(dossierConfiguration.rootVocabularyId())));
        rootCategoryId = GetterUtil.getLong(
                portletPreferences.getValue("rootCategoryId",
                String.valueOf(dossierConfiguration.rootCategoryId())));
    }
%>
