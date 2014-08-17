<jsp:directive.include file="jsp/resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="index.title"/></title>
    </head>
    <body>
        <fmt:message bundle="${labels}" key="index.table.title"/>
        <ul>
            <li>
                <a href="jsp/rights/view-all.jsp">
                    <fmt:message bundle="${labels}" key="index.list.rights"/>
                </a>
            </li>
            <li>
                <a href="#">
                    <fmt:message bundle="${labels}" key="index.list.modules"/>
                </a>
            </li>
            <li>
                <a href="#">
                    <fmt:message bundle="${labels}" key="index.list.modules.hierarchy"/>
                </a>
            </li>
            <li>
                <a href="#">
                    <fmt:message bundle="${labels}" key="index.list.user.groups"/>
                </a>
            </li>
            <li>
                <a href="#">
                    <fmt:message bundle="${labels}" key="index.list.user.rights"/>
                </a>
            </li>
        </ul> 
    </body>
</html>