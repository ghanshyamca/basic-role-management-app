<jsp:directive.include file="delete-status.jsp"/>

<p>
    [<a href="../../index.jsp"><fmt:message bundle="${labels}" 
                 key="common.cancel"/></a>]
    [<a href="pre-add.jsp"><fmt:message bundle="${labels}" 
                             key="common.add"/></a>]
    <c:if test="${null != param.v}">
        <c:set scope="page" value='href="view-all.jsp"' var="href"/>
    </c:if>
    [<a ${href}><fmt:message bundle="${labels}" 
                             key="common.all"/></a> |
    <c:remove scope="page" var="href"/>
    <c:if test="${active != param.v}">
        <c:set scope="page" value='href="view-all.jsp?v=${active}"' var="href"/>
    </c:if>
    <a ${href}><fmt:message bundle="${labels}" 
                             key="common.active"/></a> |
    <c:remove scope="page" var="href"/>
    <c:if test="${inactive != param.v}">
        <c:set scope="page" value='href="view-all.jsp?v=${inactive}"' var="href"/>
    </c:if>
    <a ${href}><fmt:message bundle="${labels}" 
                             key="common.inactive"/></a>]
    <c:remove scope="page" var="href"/>
</p>