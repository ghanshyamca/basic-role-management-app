<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../delete-status.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="rights.edit.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <p>
        <div class="error-font-color">${error_msg}</div>
        <div class="success-font-color">${success_msg}</div>
        </p>
        <c:set scope="page" value="true" var="proceed"/>
        <c:if test='${null == param.id || param.id.trim().isEmpty()}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test='${null == param.rights || param.rights.trim().isEmpty()}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test='${null == param.deleted || param.deleted.trim().isEmpty()}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test="${proceed}">
            <form method="post" action="pre-edit.jsp">
                <input type="hidden" name="id" value="${param.id}"/>
                <input type="hidden" name="rights" value="${param.rights}"/>
                <input type="hidden" name="deleted" value="${param.deleted}"/>
                <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="rights.view.one.rights.name"/>
                    </div>
                    <div>
                        <input type="text" value="${param.rights}" 
                               disabled="disabled"/>
                        <span class="error-font-color">${rights_name_error}</span>
                    </div>
                </p>
                <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="common.status"/>
                    </div>
                    <div>
                        <c:if test='${null != param.deleted && active == param.deleted}'>
                            <c:set var="check" value='checked="checked"' scope="page"/>
                        </c:if>
                        <input type="radio" ${check} disabled="disabled"/>
                        <label>
                            <fmt:message bundle="${labels}" 
                                         key="common.active"/>
                        </label>
                        <c:remove scope="page" var="check"/>
                        <c:if test='${null != param.deleted && inactive == param.deleted}'>
                            <c:set var="check" value='checked="checked"' scope="page"/>
                        </c:if>
                        <input type="radio" ${check} disabled="disabled"/>
                        <label>
                            <fmt:message bundle="${labels}" 
                                         key="common.inactive"/>
                        </label>
                        <span class="error-font-color">${rights_status_error}</span>
                    </div>
                </p>
                <p>
                    [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                         key="common.cancel"/></a>]
                    <fmt:message bundle="${labels}" scope="page" var="txt" 
                                key="common.edit" />
                    <input type="submit" value="${txt}"/>
                </p>
            </form>
        </c:if>
        <c:if test="${!proceed}">
            <p class="error-font-color">
                <fmt:message bundle="${messages}"
                             key="rights.view.one.info.invalid"/>
            </p>
            <p>
                [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                             key="common.cancel"/></a>]
            </p>
        </c:if>
    </body>
</html>