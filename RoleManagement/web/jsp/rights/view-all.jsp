<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="rights.view.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
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
                        <th>
                            <fmt:message bundle="${labels}" 
                                         key="rights.view.column.rights"/>
                        </th>
                        <th>
                            <fmt:message bundle="${labels}" 
                                         key="rights.view.column.actions"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td>${row.rights_text}</td>
                            <td>
                                <a href="javascript:alert('Edit: ${rights_id}');">
                                    <fmt:message bundle="${labels}" 
                                                 key="rights.view.link.edit.text"/>
                                </a>
                            </td>
                        </tr>
                        <c:set scope="page" var="count" value="${1 + count}"/>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <fmt:message bundle="${labels}" 
                                 key="rights.view.total.count"/> ${count}
                </tfoot>
                <tfoot>
                    [<a href="pre-add.jsp">
                        <fmt:message bundle="${labels}" 
                                     key="rights.view.link.add.text"/>
                    </a>]
                </tfoot>
            </table>
        </c:if>

        <c:if test="${null != error}">
            <div class="error-font-color">
                <fmt:message key="server.error" bundle="${messages}"/>
                ${error}
            </div>
        </c:if> 
    </body>
</html>