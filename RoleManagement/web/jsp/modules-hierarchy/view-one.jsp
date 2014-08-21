<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" 
                         key="modules.hierarchy.view.one.page.title"/>
        </title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <c:set scope="page" value="true" var="proceed"/>
        <c:if test='${null == param.oldParent}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test='${null == param.oldChild}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test="${proceed}">
            <c:catch var="error">
                <sql:query dataSource="${jdbcDsn}" scope="page" var="parents">
                    select modules_text from modules_tbl where modules_id = ?
                     <sql:param value="${param.oldParent}"/>
                </sql:query>
                <sql:query dataSource="${jdbcDsn}" scope="page" var="childs">
                    select modules_text from modules_tbl where modules_id = ?
                     <sql:param value="${param.oldChild}"/>
                </sql:query>
            </c:catch>
            <c:if test="${null == error}">
                <form method="post" action="pre-edit.jsp">
                    <input type="hidden" name="oldParent" value="${param.oldParent}"/>
                    <input type="hidden" name="oldChild" value="${param.oldChild}"/>
                    <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="modules.hierarchy.edit.parent"/>
                    </div>
                    <div>
                        <select disabled="disabled">
                            <option value="-1"><fmt:message bundle="${labels}" 
                                         key="modules.hierarchy.edit.select"/></option>
                            <c:forEach items="${parents.rows}" var="parent">
                                <c:if test="${parent.modules_id == parentId}">
                                    <c:set scope="page" value='selected="selected"'
                                           var="selected"/>
                                </c:if>
                                <option ${selected}>${parent.modules_text}</option>
                                <c:remove scope="page" var="selected"/>
                            </c:forEach>
                        </select>
                    </div>
                    </p>
                    <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="modules.hierarchy.edit.child"/>
                    </div>
                    <div>
                        <select disabled="disabled">
                            <option value="-1"><fmt:message bundle="${labels}" 
                                         key="modules.hierarchy.edit.select"/></option>
                            <c:forEach items="${childs.rows}" var="child">
                                <c:if test="${child.modules_id == childId}">
                                    <c:set scope="page" value='selected="selected"'
                                           var="selected"/>
                                </c:if>
                                <option ${selected}>${child.modules_text}</option>
                                <c:remove scope="page" var="selected"/>
                            </c:forEach>
                        </select>
                    </div>
                    </p>
                    <p>
                        [<a href="view-all.jsp"><fmt:message bundle="${labels}"
                                     key="modules.hierarchy.edit.cancel"/></a>]
                        <fmt:message bundle="${labels}" scope="page" var="txt"
                                     key="modules.hierarchy.edit.update"/>
                        <input type="submit" value="${txt}"/>
                    </p>
                </form>
            </c:if>
            <c:if test="${null != error}">
                <p class="error-font-color bold-font">
                    <fmt:message bundle="${messages}" key="server.error"/>
                </p>
            </c:if>
        </c:if>
        <c:if test="${!proceed}">
            <p class="error-font-color">
                <fmt:message bundle="${messages}" 
                             key="modules.hierarchy.edit.info.invalid"/>
            </p>
            <p>
                [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                             key="modules.hierarchy.edit.cancel"/></a>]
            </p>
        </c:if>
    </body>
</html>