<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" 
                     key="user.groups.rights.add.page.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <p>
            <div class="error-font-color">${error_msg}</div>
            <div class="success-font-color">${success_msg}</div>
        </p>
        <c:catch var="error">
            <sql:query dataSource="${jdbcDsn}" scope="page" var="groups">
                select * from user_groups_rights_tbl
            </sql:query>
        </c:catch>
        <c:if test="${null == error}">
            <form method="post" action="post-add.jsp">
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