<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../delete-status.jsp"/>
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
                select * from modules_tbl where modules_deleted = 0
            </sql:query>
            <sql:query dataSource="${jdbcDsn}" scope="page" var="childs">
                select * from modules_tbl where modules_deleted = 0
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
                        <c:forEach items="${parents.rows}" var="parent">
                            <option value="${parent.modules_id}">
                                ${parent.modules_text}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                </p>
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" 
                                 key="modules.hierarchy.add.child"/>
                </div>
                <div>
                    <select name="child">
                        <c:forEach items="${childs.rows}" var="child">
                            <option value="${child.modules_id}">
                                ${child.modules_text}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                </p>
            </form>
        </c:if>
        <c:if test="${null != error}">
            <p class="error-font-color">
                <fmt:message bundle="${messages}" key="server.error"/>
            </p>
        </c:if>
    </body>
</html>