<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="modules.view.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>

        <p>
            [<a href="../../index.jsp"><fmt:message bundle="${labels}" 
                         key="modules.view.link.cancel.text"/></a>]
            [<a href="pre-add.jsp"><fmt:message bundle="${labels}" 
                                     key="modules.view.link.add.text"/></a>]
            <c:if test="${null != param.v}">
                <c:set scope="page" value='href="view-all.jsp"' var="href"/>
            </c:if>
            [<a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.all"/></a> |
            <c:remove scope="page" var="href"/>
            <c:if test="${0 != param.v}">
                <c:set scope="page" value='href="view-all.jsp?v=0"' var="href"/>
            </c:if>
            <a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.active"/></a> |
            <c:remove scope="page" var="href"/>
            <c:if test="${1 != param.v}">
                <c:set scope="page" value='href="view-all.jsp?v=1"' var="href"/>
            </c:if>
            <a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.inactive"/></a>]
            <c:remove scope="page" var="href"/>
        </p>

        <c:catch var="error">
            <c:if test="${null == param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from modules_tbl
                </sql:query>
            </c:if>
            <c:if test="${null != param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select * from modules_tbl where modules_deleted = ?
                    <sql:param value="${param.v}"/>
                </sql:query>
            </c:if>
        </c:catch>

        <c:if test="${null == error}">
            <c:set scope="page" var="count" value="0"/>
            <fmt:message bundle="${labels}" scope="page" var="edit"
                        key="modules.view.btn.edit.text"/>
            <fmt:message bundle="${labels}" scope="page" var="view"
                        key="modules.view.btn.view.text"/>
            <p>
            <c:forEach items="${result.rows}" var="row">
                <c:set scope="page" var="count" value="${1 + count}"/>
            <div>
                <form method="post" action="pre-edit.jsp" class="margin-0-px inline">
                    <input type="hidden" name="id" 
                           value="${row.modules_id}"/>
                    <input type="hidden" name="title" 
                           value="${row.modules_text}"/>
                    <input type="hidden" name="deleted" 
                           value="${row.modules_deleted}"/>
                    <input type="submit" value="${edit}" class="inline"/>
                </form>
                <form method="post" action="view-one.jsp" class="margin-0-px inline">
                    <input type="hidden" name="id" 
                           value="${row.modules_id}"/>
                    <input type="hidden" name="title" 
                           value="${row.modules_text}"/>
                    <input type="hidden" name="deleted" 
                           value="${row.modules_deleted}"/>
                    <input type="submit" value="${view}" class="inline"/>
                </form>
                <span class="bold-font">${row.modules_text}</span>
            </div>
            </c:forEach>
            </p>

            <p>
                <fmt:message bundle="${labels}" 
                             key="modules.view.total.count"/> ${count}
            </p>
        </c:if>

        <c:if test="${null != error}">
            <p class="error-font-color">
                <fmt:message key="server.error" bundle="${messages}"/>
                ${error}
            </p>
        </c:if>

        <p>
            [<a href="../../index.jsp"><fmt:message bundle="${labels}" 
                         key="modules.view.link.cancel.text"/></a>]
            [<a href="pre-add.jsp"><fmt:message bundle="${labels}" 
                                     key="modules.view.link.add.text"/></a>]
            <c:if test="${null != param.v}">
                <c:set scope="page" value='href="view-all.jsp"' var="href"/>
            </c:if>
            [<a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.all"/></a> |
            <c:remove scope="page" var="href"/>
            <c:if test="${0 != param.v}">
                <c:set scope="page" value='href="view-all.jsp?v=0"' var="href"/>
            </c:if>
            <a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.active"/></a> |
            <c:remove scope="page" var="href"/>
            <c:if test="${1 != param.v}">
                <c:set scope="page" value='href="view-all.jsp?v=1"' var="href"/>
            </c:if>
            <a ${href}><fmt:message bundle="${labels}" 
                                     key="modules.view.modules.inactive"/></a>]
            <c:remove scope="page" var="href"/>
        </p>
    </body>
</html>