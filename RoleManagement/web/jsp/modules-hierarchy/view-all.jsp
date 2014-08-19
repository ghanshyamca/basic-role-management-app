<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" key="modules.hierarchy.view.page.title"/>
        </title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>
        <c:catch var="error">
            <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                select * from modules_hierarchy_tbl
            </sql:query>
        </c:catch>

        <c:if test="${null == error}">
            <c:set scope="page" var="count" value="0"/>
            <fmt:message bundle="${labels}" scope="page" var="edit"
                        key="modules.hierarchy.view.edit"/>
            <fmt:message bundle="${labels}" scope="page" var="view"
                        key="modules.hierarchy.view.view"/>
            <p>
            <c:forEach items="${result.rows}" var="row">
                <c:set scope="page" var="count" value="${1 + count}"/>
            </c:forEach>
            </p>

            <p>
                <fmt:message bundle="${labels}" 
                             key="modules.hierarchy.view.total.count"/> ${count}
            </p>
        </c:if>

        <c:if test="${null != error}">
            <p class="error-font-color">
                <fmt:message key="server.error" bundle="${messages}"/>
            </p>
        </c:if>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>
    </body>
</html>