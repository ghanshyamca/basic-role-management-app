<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:set scope="page" value="true" var="proceed"/>

<c:if test='${null == param.rights || "" == param.rights.trim()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="rights.add.name.empty" 
                 scope="request" var="rights_name_error"/>
</c:if>

<c:if test='${null == param.status || "" == param.status.trim()}'>
    <c:set scope="page" value="false" var="proceed"/>
    <fmt:message bundle="${messages}" key="rights.add.status.empty" 
                 scope="request" var="rights_status_error"/>
</c:if>

<c:if test="${proceed}">
    <c:catch var="error">
        <sql:query dataSource="${jdbcDsn}" scope="page" var="result">
            select rights_text from rights_tbl where lower(rights_text) = lower(?)
            <sql:param value="${param.rights}"/>
        </sql:query>
    </c:catch>

    <c:if test="${null == error}">
        <c:forEach items="${result.rows}" var="row">
            <fmt:message bundle="${messages}" key="rights.add.name.exist"
                         scope="request" var="error_msg"/>
            <c:set scope="page" value="false" var="proceed"/>
        </c:forEach>
    </c:if>

    <c:if test="${null != error}">
        <c:set scope="request" var="error_msg" value="${error}"/>
        <c:set scope="page" value="false" var="proceed"/>
    </c:if>
</c:if>

<c:if test="${proceed}">

    <c:set scope="page" value='${"false" == param.status}' var="deleted"/>

    <c:catch var="error">
        <sql:update dataSource="${jdbcDsn}" scope="page" var="result">
            insert into rights_tbl (rights_text, rights_deleted) values (?, ?)
            <sql:param value="${param.rights}"/>
            <sql:param value="${deleted}"/>
        </sql:update>
    </c:catch>

    <c:if test="${null == error}">
        <fmt:message bundle="${messages}" key="rights.add.success" scope="request"
                     var="success_msg"/>
        <c:set scope="request" value="${success_msg} ${result}" var="success_msg"/>
    </c:if>

    <c:if test="${null != error}">
        <c:set scope="request" var="error_msg" value="${error}"/>
        <c:set scope="page" value="false" var="proceed"/>
    </c:if>
</c:if>

<jsp:forward page="pre-add.jsp"/>