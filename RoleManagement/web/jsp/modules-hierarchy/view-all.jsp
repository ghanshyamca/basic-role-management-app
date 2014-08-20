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
            <c:if test="${null == param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select t.* from (
                      select mp.modules_text as parent_text,
                      mc.modules_text as child_text
                      from modules_hierarchy_tbl mh
                      inner join modules_tbl mp on
                       mh.modules_parent_id = mp.modules_id
                      inner join modules_tbl mc on
                       mh.modules_child_id = mc.modules_id
                    ) t
                </sql:query>
            </c:if> 
            <c:if test="${null != param.v}">
                <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
                    select t.* from (
                      select mp.modules_text as parent_text,
                      mc.modules_text as child_text
                      from modules_hierarchy_tbl mh
                      inner join modules_tbl mp on
                       mh.modules_parent_id = mp.modules_id
                      inner join modules_tbl mc on
                       mh.modules_child_id = mc.modules_id
                      where mp.modules_deleted = ?
                       and mc.modules_deleted = ?
                    ) t
                    <sql:param value="${param.v}"/>
                    <sql:param value="${param.v}"/>
                </sql:query>
            </c:if>
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
            <div>
                <ul>
                    <li>${row.parent_text}
                        <ul>
                            <li>${row.child_text}</li>
                        </ul>
                    </li>
                </ul>
            </div>
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