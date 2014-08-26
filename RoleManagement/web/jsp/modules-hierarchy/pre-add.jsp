<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" 
                     key="modules.hierarchy.add.page.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <p>
            <div class="error-font-color">${error_msg}</div>
            <div class="success-font-color">${success_msg}</div>
        </p>
        <c:catch var="error">
            <sql:query dataSource="${jdbcDsn}" scope="page" var="parents">
                select * from modules_tbl
            </sql:query>
            <sql:query dataSource="${jdbcDsn}" scope="page" var="childs">
                select p.* from modules_tbl p where
                 p.modules_id not in(select c.modules_child_id from
                modules_hierarchy_tbl c)
            </sql:query>
        </c:catch>
        <c:if test="${null == error}">
            <form method="post" action="post-add.jsp">
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" 
                                 key="modules.hierarchy.add.parent"/>
                </div>
                <div>
                    <select name="parent">
                        <option value="-1"><fmt:message bundle="${labels}" 
                                     key="common.select"/></option>
                        <c:forEach items="${parents.rows}" var="parent">
                            <c:if test="${parent.modules_id == param.parent}">
                                <c:set scope="page" value='selected="selected"'
                                       var="selected"/>
                            </c:if>
                            <option value="${parent.modules_id}" ${selected}>
                                ${parent.modules_text}
                            </option>
                            <c:remove scope="page" var="selected"/>
                        </c:forEach>
                    </select>
                    <span class="error-font-color">${parent_error}</span>
                </div>
                </p>
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" 
                                 key="modules.hierarchy.add.child"/>
                </div>
                <div>
                    <select name="child">
                        <option value="-1"><fmt:message bundle="${labels}" 
                                     key="common.select"/></option>
                        <c:forEach items="${childs.rows}" var="child">
                            <c:if test="${child.modules_id == param.child}">
                                <c:set scope="page" value='selected="selected"'
                                       var="selected"/>
                            </c:if>
                            <option value="${child.modules_id}" ${selected}>
                                ${child.modules_text}
                            </option>
                            <c:remove scope="page" var="selected"/>
                        </c:forEach>
                    </select>
                    <span class="error-font-color">${child_error}</span>
                </div>
                </p>
                <p>
                    [<a href="view-all.jsp"><fmt:message bundle="${labels}"
                                 key="common.cancel"/></a>]
                    <fmt:message bundle="${labels}" scope="page" var="txt"
                                 key="common.create"/>
                    <input type="submit" value="${txt}"/>
                </p>
            </form>
        </c:if>
        <c:if test="${null != error}">
            <p class="error-font-color bold-font">
                <fmt:message bundle="${messages}" key="server.error"/>
            </p>
        </c:if>
    </body>
</html>