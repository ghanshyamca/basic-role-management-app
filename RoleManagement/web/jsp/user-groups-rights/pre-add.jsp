<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../delete-status.jsp"/>

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
            <sql:query dataSource="${jdbcDsn}" scope="page" var="rights">
                select rights_id, rights_text from rights_tbl
                 where rights_deleted = ?
                 <sql:param value="${active}"/>
            </sql:query>
            <sql:query dataSource="${jdbcDsn}" scope="page" var="modules">
                select modules_id, modules_text from modules_tbl
                 where modules_deleted = ?
                 <sql:param value="${active}"/>
            </sql:query>
            <sql:query dataSource="${jdbcDsn}" scope="page" var="groups">
                select user_group_id, user_group_text from user_group_tbl
                 where user_group_deleted = ?
                 <sql:param value="${active}"/>
            </sql:query>
        </c:catch>
        <c:if test="${null == error}">
            <fmt:message bundle="${labels}" key="common.select" scope="page" var="select"/>
            <form method="post" action="post-add.jsp">
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" key="common.title.right"/>
                </div>
                <div>
                    <select name="right">
                        <option value="0">${select}</option>
                        <c:forEach items="${rights.rows}" var="right">
                            <option value="${right.rights_id}">${right.rights_text}</option>
                        </c:forEach>
                    </select>
                </div>
                </p>
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" key="common.title.module"/>
                </div>
                <div>
                    <select name="module">
                        <option value="0">${select}</option>
                        <c:forEach items="${modules.rows}" var="modules">
                            <option value="${modules.modules_id}">${modules.modules_text}</option>
                        </c:forEach>
                    </select>
                </div>
                </p>
                <p>
                <div class="bold-font">
                    <fmt:message bundle="${labels}" key="user.groups.title"/>
                </div>
                <div>
                    <select name="group">
                        <option value="0">${select}</option>
                        <c:forEach items="${groups.rows}" var="groups">
                            <option value="${groups.user_group_id}">${groups.user_group_text}</option>
                        </c:forEach>
                    </select>
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