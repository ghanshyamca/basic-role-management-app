<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../jdbc-dsn.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" 
                         key="modules.hierarchy.edit.page.title"/>
        </title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <p>
        <div class="error-font-color">${error_msg}</div>
        <div class="success-font-color">${success_msg}</div>
        </p>
        <c:set scope="page" value="true" var="proceed"/>
        <c:if test='${null == param.oldParent}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test='${null == param.oldChild}'>
            <c:set scope="page" value="false" var="proceed"/>
        </c:if>
        <c:if test="${proceed}">
            <c:if test="${null == child_error}">
                <c:if test="${null == param.newChild or -1 == param.newChild}">
                    <c:set scope="page" value="${param.oldChild}" var="childId"/>
                </c:if>
                <c:if test="${null != param.newChild and -1 != param.newChild}">
                    <c:set scope="page" value="${param.newChild}" var="childId"/>
                </c:if>
            </c:if>
            <c:if test="${null != child_error}">
                <c:set scope="page" value="${param.newChild}" var="childId"/>
            </c:if>
            <c:catch var="error">
                <sql:query dataSource="${jdbcDsn}" scope="page" var="parents">
                    select * from modules_tbl
                </sql:query>
                <sql:query dataSource="${jdbcDsn}" scope="page" var="childs">
                    select p.* from modules_tbl p where
                     p.modules_id not in(select c.modules_child_id from
                    modules_hierarchy_tbl c) or p.modules_id = ?
                    <sql:param value="${param.oldChild}"/>
                </sql:query>
            </c:catch>
            <c:if test="${null == error}">
                <form method="post" action="post-edit.jsp">
                    <input type="hidden" name="oldParent" value="${param.oldParent}"/>
                    <input type="hidden" name="oldChild" value="${param.oldChild}"/>
                    <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="modules.hierarchy.edit.parent"/>
                    </div>
                    <div>
                        <c:set scope="page" value="${param.newParent}" var="parentId"/>
                        <c:if test="${null == param.newParent}">
                            <c:set scope="page" value="${param.oldParent}" var="parentId"/>
                        </c:if>
                        <select name="newParent">
                            <option value="-1"><fmt:message bundle="${labels}" 
                                         key="common.select"/></option>
                            <c:forEach items="${parents.rows}" var="parent">
                                <c:if test="${parent.modules_id == parentId}">
                                    <c:set scope="page" value='selected="selected"'
                                           var="selected"/>
                                </c:if>
                                <option value="${parent.modules_id}" ${selected}>
                                    ${parent.modules_text}
                                </option>
                                <c:remove scope="page" var="selected"/>
                            </c:forEach>
                        </select>
                        <span class="error-font-color">${parent_error}</span>
                        <c:remove scope="page" var="parentId"/>
                    </div>
                    </p>
                    <p>
                    <div class="bold-font">
                        <fmt:message bundle="${labels}" 
                                     key="modules.hierarchy.edit.child"/>
                    </div>
                    <div>
                        <select name="newChild">
                            <option value="-1"><fmt:message bundle="${labels}" 
                                         key="common.select"/></option>
                            <c:forEach items="${childs.rows}" var="child">
                                <c:if test="${child.modules_id == childId}">
                                    <c:set scope="page" value='selected="selected"'
                                           var="selected"/>
                                </c:if>
                                <option value="${child.modules_id}" ${selected}>
                                    ${child.modules_text}
                                </option>
                                <c:remove scope="page" var="selected"/>
                            </c:forEach>
                        </select>
                        <span class="error-font-color">${child_error}</span>
                    </div>
                    </p>
                    <p>
                        [<a href="view-all.jsp"><fmt:message bundle="${labels}"
                                     key="common.cancel"/></a>]
                        <fmt:message bundle="${labels}" scope="page" var="txt"
                                     key="common.update"/>
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
                             key="common.cancel"/></a>]
            </p>
        </c:if>
    </body>
</html>