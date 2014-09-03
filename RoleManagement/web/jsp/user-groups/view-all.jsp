<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" key="user.groups.view.page.title"/>
        </title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>
        <c:catch var="error">
            <c:if test="${null == param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from user_group_tbl
                </sql:query>
            </c:if> 
            <c:if test="${null != param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from user_group_tbl where user_group_deleted = ?
                    <sql:param value="${param.v}"/>
                </sql:query>
            </c:if>
        </c:catch>

        <c:if test="${null == error}">
            <c:set scope="page" var="count" value="0"/>
            <fmt:message bundle="${labels}" scope="page" var="edit"
                        key="common.edit"/>
            <fmt:message bundle="${labels}" scope="page" var="view"
                        key="common.view"/>
            <p>
            <c:forEach items="${result.rows}" var="row">
                <c:set scope="page" var="count" value="${1 + count}"/>
            <div>
                <form action="pre-edit.jsp" method="post" class="margin-0-px inline">
                    <input type="hidden" name="id" value="${row.user_group_id}"/>
                    <input type="hidden" name="title" value="${row.user_group_text}"/>
                    <input type="hidden" name="deleted" value="${row.user_group_deleted}"/>
                    <input type="submit" value="${edit}" class="inline"/>
                </form>
                <form action="view-one.jsp" method="post" class="margin-0-px inline">
                    <input type="hidden" name="id" value="${row.user_group_id}"/>
                    <input type="hidden" name="title" value="${row.user_group_text}"/>
                    <input type="hidden" name="deleted" value="${row.user_group_deleted}"/>
                    <input type="submit" value="${view}" class="inline"/>
                </form>
                <span class="bold-font">
                    ${row.user_group_text}
                </span>
            </div>
            </c:forEach>
            </p>

            <p>
                <fmt:message bundle="${labels}" 
                             key="user.groups.view.total.count"/> ${count}
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