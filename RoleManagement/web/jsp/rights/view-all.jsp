<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="rights.view.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>

        <c:catch var="error">
            <c:if test="${null == param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from rights_tbl
                </sql:query>
            </c:if>
            <c:if test="${null != param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from rights_tbl where rights_deleted = ?
                    <sql:param value="${param.v}"/>
                </sql:query>
            </c:if>
        </c:catch>

        <c:if test="${null == error}">
            <c:set scope="page" var="count" value="0"/>
            <fmt:message bundle="${labels}" scope="page" var="edit"
                        key="rights.view.btn.edit.text"/>
            <fmt:message bundle="${labels}" scope="page" var="view"
                        key="rights.view.btn.view.text"/>
            <p>
            <c:forEach items="${result.rows}" var="row">
                <c:set scope="page" var="count" value="${1 + count}"/>
            <div>
                <form method="post" action="pre-edit.jsp" class="margin-0-px inline">
                    <input type="hidden" name="id" 
                           value="${row.rights_id}"/>
                    <input type="hidden" name="rights" 
                           value="${row.rights_text}"/>
                    <input type="hidden" name="deleted" 
                           value="${row.rights_deleted}"/>
                    <input type="submit" value="${edit}" class="inline"/>
                </form>
                <form method="post" action="view-one.jsp" class="margin-0-px inline">
                    <input type="hidden" name="id" 
                           value="${row.rights_id}"/>
                    <input type="hidden" name="rights" 
                           value="${row.rights_text}"/>
                    <input type="hidden" name="deleted" 
                           value="${row.rights_deleted}"/>
                    <input type="submit" value="${view}" class="inline"/>
                </form>
                <span class="bold-font">${row.rights_text}</span>
            </div>
            </c:forEach>
            </p>

            <p>
                <fmt:message bundle="${labels}" 
                             key="rights.view.total.count"/> ${count}
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