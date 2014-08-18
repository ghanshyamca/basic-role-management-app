<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<jsp:directive.include file="../resource-bundles.jsp"/>

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
                                 key="modules.add.status"/>
                </div>
                <div>
                    <c:if test='${null == param.deleted && null == deleted_error}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <c:if test='${null != param.deleted && 0 == param.deleted}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <input type="radio" name="deleted" value="0" 
                           id="status0" ${check}/>
                    <label for="status0">
                        <fmt:message bundle="${labels}" key="modules.add.active"/>
                    </label>
                    <c:remove scope="page" var="check"/>
                    <c:if test='${null != param.deleted && 1 == param.deleted}'>
                        <c:set var="check" value='checked="checked"' scope="page"/>
                    </c:if>
                    <input type="radio" name="deleted" value="1" 
                           id="status1" ${check}/>
                    <label for="status1">
                        <fmt:message bundle="${labels}" 
                                     key="modules.add.inactive"/>
                    </label>
                    <span class="error-font-color">${deleted_error}</span>
                </div>
            </p>
            <p>
                [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                     key="modules.add.cancel"/></a>]
                <fmt:message bundle="${labels}" scope="page" var="txt" 
                            key="modules.add.save" />
                <input type="submit" value="${txt}"/>
            </p>
        </form>
    </body>
</html>