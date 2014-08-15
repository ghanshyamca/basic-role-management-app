<%@taglib prefix="sql" uri="/WEB-INF/tld/sql.tld"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>

<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:catch var="error">
    <sql:query dataSource="jdbcDsn" var="rows" scope="page">
        select * from rights_tbl
    </sql:query>
</c:catch>

<c:if test="${null == error}">
    got connection ...
</c:if>

<c:if test="${null != error}">
    <font red="red">Something went wrong ...</font>
    ${error}
</c:if>