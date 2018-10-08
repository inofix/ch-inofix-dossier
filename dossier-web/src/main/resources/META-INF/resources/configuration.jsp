<%--
    configuration.jsp
--%>

<%@ include file="/init.jsp" %>

<%
    PortletURL portletURL = renderResponse.createRenderURL();

    String namespace = liferayPortletResponse.getNamespace();
%>
<liferay-portlet:actionURL portletConfiguration="<%=true%>"
    var="configurationActionURL" />

<liferay-portlet:renderURL portletConfiguration="<%=true%>"
    var="configurationRenderURL" />

<aui:form action="<%=configurationActionURL%>" method="post" name="fm">

    <div class="portlet-configuration-body-content">

        <div class="container-fluid-1280">

            <liferay-ui:panel collapsible="<%=true%>"
                id="DossierSearchPanel"
                persistState="<%=true%>"
                title="dossier-search">

                <aui:fieldset cssClass="col-md-6">

                    <aui:input
                        type="checkbox"
                        name="doIncludeParentScope"
                        value="<%=doIncludeParentScope%>"
                        helpMessage="do-include-parent-scope-help" />
                    <aui:input
                        name="rootVocabularyId"
                        value="<%=String.valueOf(rootVocabularyId)%>"
                        helpMessage="root-vocabulary-id-help" />
                    <aui:input
                        name="rootCategoryId"
                        value="<%=String.valueOf(rootCategoryId)%>"
                        helpMessage="root-category-id-help" />
                </aui:fieldset>
            </liferay-ui:panel>
        </div>

        <aui:button-row>
            <aui:button type="submit" />
        </aui:button-row>

    </div>

</aui:form>

