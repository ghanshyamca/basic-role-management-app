<%@taglib prefix="sql" uri="/WEB-INF/tld/sql.tld"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>

<jsp:directive.include file="../jdbc-dsn.jsp"/>

<c:catch var="error">
    <sql:query dataSource="${jdbcDsn}" var="result" scope="page">
        select * from rights_tbl
    </sql:query>
</c:catch>

<c:if test="${null == error}">
    <c:set scope="page" var="count" value="0"/>
    <table>
        <thead>
            <tr>
                <th>Rights</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${result.rows}" var="row">
                <tr>
                    <td>${row.rights_text}</td>
                    <td><a href="javascript:alert('Edit: ${rights_id}');">Edit</a></td>
                </tr>
                <c:set scope="page" var="count" value="${1 + count}"/>
            </c:forEach>
        </tbody>
        <tfoot>
            Total Records: ${count}
        </tfoot>
    </table>
</c:if>

<c:if test="${null != error}">
    <font red="red">Something went wrong ...</font>
</c:if>