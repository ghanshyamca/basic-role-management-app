<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:set scope="page" value="true" var="proceed"/>

<c:if test='${null == param.title || "" == param.title.trim()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.edit.title.empty" 
                 scope="request" var="title_error"/>
</c:if>

<c:if test='${null == param.deleted || "" == param.deleted.trim()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="modules.edit.status.empty" 
                 scope="request" var="status_error"/>
</c:if>

<c:if test='${null == param.id || "" == param.id.trim()}'>
    <c:set scope="page" value="false" var="proceed"/>
</c:if>

<c:if test="${proceed}">
    <c:catch var="error">
        <sql:query dataSource="${jdbcDsn}" scope="page" var="result">
            select modules_text from modules_tbl where lower(modules_text) = lower(?)
            and modules_id != ?
            <sql:param value="${param.title}"/>
            <sql:param value="${param.id}"/>
        </sql:query>
    </c:catch>

    <c:if test="${null == error}">
        <c:forEach items="${result.rows}" var="row">
            <fmt:message bundle="${messages}" key="modules.edit.title.exist"
                         scope="request" var="error_msg"/>
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
            update modules_tbl set modules_text = ?, modules_deleted = ? where
            modules_id = ?
            <sql:param value="${param.title}"/>
            <sql:param value="${param.deleted}"/>
            <sql:param value="${param.id}"/>
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