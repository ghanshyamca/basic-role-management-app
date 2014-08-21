<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:set scope="page" value="true" var="proceed"/>

<c:if test='${null == param.oldParent || param.oldParent.trim().isEmpty()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.edit.info.invalid" 
                 scope="request" var="error_msg"/>
</c:if>

<c:if test='${null == param.oldChild || param.oldChild.trim().isEmpty()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.edit.info.invalid" 
                 scope="request" var="error_msg"/>
</c:if>

<c:if test='${null == param.newParent || -1 == param.newParent}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.edit.parent.empty" 
                 scope="request" var="parent_error"/>
</c:if>

<c:if test='${null == param.newChild || -1 == param.newChild}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.hierarchy.edit.child.empty" 
                 scope="request" var="child_error"/>
</c:if>

<c:if test="${proceed}">
    <c:catch var="error">
        <sql:query dataSource="${jdbcDsn}" scope="page" var="result">
            select modules_parent_id from modules_hierarchy_tbl where 
                modules_parent_id = ? and modules_child_id = ?
            <sql:param value="${param.newParent}"/>
            <sql:param value="${param.newChild}"/>
        </sql:query>
    </c:catch>

    <c:if test="${null == error}">
        <c:forEach items="${result.rows}" var="row">
            <fmt:message bundle="${messages}" scope="request" var="error_msg" 
                         key="modules.hierarchy.edit.hierarchy.exist"/>
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
            update modules_hierarchy_tbl set modules_parent_id = ?, 
            modules_child_id = ? where modules_parent_id = ? and
            modules_child_id = ?
            <sql:param value="${param.newParent}"/>
            <sql:param value="${param.newChild}"/>
            <sql:param value="${param.oldParent}"/>
            <sql:param value="${param.oldChild}"/>
        </sql:update>
    </c:catch>

    <c:if test="${null == error}">
        <fmt:message bundle="${messages}" key="modules.edit.success" scope="request"
                     var="success_msg"/>
        <c:set scope="request" value="${success_msg} ${result}" var="success_msg"/>
    </c:if>

    <c:if test="${null != error}">
        <fmt:message bundle="${messages}" key="server.error" scope="request" 
                     var="error_msg"/>
        <c:set scope="page" value="false" var="proceed"/>
    </c:if>
</c:if>

<jsp:forward page="pre-edit.jsp"/>