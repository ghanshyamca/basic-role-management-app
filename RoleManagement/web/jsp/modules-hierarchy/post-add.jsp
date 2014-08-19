<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:set scope="page" value="true" var="proceed"/>

<c:if test='${null == param.parent || -1 == param.parent}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.add.parent.empty" 
                 scope="request" var="parent_error"/>
</c:if>

<c:if test='${null == param.child || -1 == param.child}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.add.child.empty" 
                 scope="request" var="child_error"/>
</c:if>

<c:if test="${proceed}">
    <c:catch var="error">
        <sql:query dataSource="${jdbcDsn}" scope="page" var="result">
            select * from modules_hierarchy_tbl where modules_parent_id=?
            and modules_child_id=?
            <sql:param value="${param.parent}"/>
            <sql:param value="${param.child}"/>
        </sql:query>
    </c:catch>

    <c:if test="${null == error}">
        <c:forEach items="${result.rows}" var="row">
            <fmt:message bundle="${messages}" scope="request" var="error_msg" 
                         key="modules.hierarchy.add.hierarchy.exist"/>
            <c:set scope="page" value="false" var="proceed"/>
        </c:forEach>
    </c:if>

    <c:if test="${null != error}">
        <fmt:message bundle="${messages}" key="server.error" scope="request" 
                     var="error_msg"/>
        <c:set scope="page" value="false" var="proceed"/>
    </c:if>
</c:if>

<c:if test="${proceed}">

    <c:catch var="error">
        <sql:update dataSource="${jdbcDsn}" scope="page" var="result">
            insert into modules_hierarchy_tbl values (?, ?)
            <sql:param value="${param.parent}"/>
            <sql:param value="${param.child}"/>
        </sql:update>
    </c:catch>

    <c:if test="${null == error}">
        <fmt:message bundle="${messages}" key="modules.hierarchy.add.success" 
                     scope="request" var="success_msg"/>
        <c:set scope="request" value="${success_msg} ${result}" var="success_msg"/>
    </c:if>

    <c:if test="${null != error}">
        <fmt:message bundle="${messages}" key="server.error" scope="request" 
                     var="error_msg"/>
        <c:set scope="page" value="false" var="proceed"/>
    </c:if>
</c:if>

<jsp:forward page="pre-add.jsp"/>