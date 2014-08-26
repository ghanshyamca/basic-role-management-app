<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../delete-status.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" 
                     key="modules.add.page.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <p>
            <div class="error-font-color">${error_msg}</div>
            <div class="success-font-color">${success_msg}</div>
        </p>
        <form method="post" action="post-add.jsp">
            <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" 
                                 key="modules.add.title"/>
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
                    <c:if test='${null == param.deleted && null == status_error}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <c:if test='${null != param.deleted && active == param.deleted}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <input type="radio" name="deleted" value="${active}" 
                           id="status${active}" ${check}/>
                    <label for="status${active}">
                        <fmt:message bundle="${labels}" key="common.active"/>
                    </label>
                    <c:remove scope="page" var="check"/>
                    <c:if test='${null != param.deleted && inactive == param.deleted}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <input type="radio" name="deleted" value="${inactive}" 
                           id="status${inactive}" ${check}/>
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
                            key="common.create" />
                <input type="submit" value="${txt}"/>
            </p>
        </form>
    </body>
</html>