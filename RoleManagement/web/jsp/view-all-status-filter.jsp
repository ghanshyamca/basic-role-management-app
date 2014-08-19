<p>
    [<a href="../../index.jsp"><fmt:message bundle="${labels}" 
                 key="common.view.cancel"/></a>]
    [<a href="pre-add.jsp"><fmt:message bundle="${labels}" 
                             key="common.view.add"/></a>]
    <c:if test="${null != param.v}">
        <c:set scope="page" value='href="view-all.jsp"' var="href"/>
    </c:if>
    [<a ${href}><fmt:message bundle="${labels}" 
                             key="common.view.all"/></a> |
    <c:remove scope="page" var="href"/>
    <c:if test="${0 != param.v}">
        <c:set scope="page" value='href="view-all.jsp?v=0"' var="href"/>
    </c:if>
    <a ${href}><fmt:message bundle="${labels}" 
                             key="common.view.active"/></a> |
    <c:remove scope="page" var="href"/>
    <c:if test="${1 != param.v}">
        <c:set scope="page" value='href="view-all.jsp?v=1"' var="href"/>
    </c:if>
    <a ${href}><fmt:message bundle="${labels}" 
                             key="common.view.inactive"/></a>]
    <c:remove scope="page" var="href"/>
</p>