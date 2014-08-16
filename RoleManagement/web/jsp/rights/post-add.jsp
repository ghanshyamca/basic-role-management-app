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

<c:if test="${!proceed}">
    false
</c:if>

<c:if test="${proceed}">
    true
</c:if>
