<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" key="modules.edit.page.title"/>
        </title>
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
        <c:if test='${null == param.title || param.title.trim().isEmpty()}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test='${null == param.deleted || param.deleted.trim().isEmpty()}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test="${proceed}">
            <form method="post" action="post-edit.jsp">
                <input type="hidden" name="id" value="${param.id}"/>
                <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="modules.edit.title"/>
                    </div>
                    <div>
                        <input type="text" name="title" value="${param.title}" 
                           size="20" maxlength="20"/>
                        <span class="error-font-color">${title_error}</span>
                    </div>
                </p>
                <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="common.status"/>
                    </div>
                    <div>
                        <c:if test='${null != param.deleted && 0 == param.deleted}'>
                            <c:set var="check" value='checked="checked"' scope="page"/>
                        </c:if>
                        <input type="radio" name="deleted" value="0" 
                               id="status0" ${check}/>
                        <label for="status0">
                            <fmt:message bundle="${labels}" 
                                         key="common.active"/>
                        </label>
                        <c:remove scope="page" var="check"/>
                        <c:if test='${null != param.deleted && 1 == param.deleted}'>
                            <c:set var="check" value='checked="checked"' scope="page"/>
                        </c:if>
                        <input type="radio" name="deleted" value="1" 
                               id="status1" ${check}/>
                        <label for="status1">
                            <fmt:message bundle="${labels}" 
                                         key="common.inactive"/>
                        </label>
                        <span class="error-font-color">${status_error}</span>
                    </div>
                </p>
                <p>
                    [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                         key="common.cancel"/></a>]
                    <fmt:message bundle="${labels}" scope="page" var="txt" 
                                key="common.update" />
                    <input type="submit" value="${txt}"/>
                </p>
            </form>
        </c:if>
        <c:if test="${!proceed}">
            <p class="error-font-color">
                <fmt:message bundle="${messages}" key="modules.edit.info.invalid"/>
            </p>
            <p>
                [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                             key="common.cancel"/></a>]
            </p>
        </c:if>
    </body>
</html>