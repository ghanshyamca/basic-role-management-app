<jsp:directive.include file="jsp/resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="index.title"/></title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <p class="bold-font">
            <fmt:message bundle="${labels}" key="index.table.title"/>
        </p>
        <ul>
            <li>
                <a href="jsp/rights/view-all.jsp">
                    <fmt:message bundle="${labels}" key="index.list.rights"/>
                </a>
            </li>
            <li>
                <a href="jsp/modules/view-all.jsp">
                    <fmt:message bundle="${labels}" key="index.list.modules"/>
                </a>
            </li>
            <li>
                <a href="jsp/modules-hierarchy/view-all.jsp">
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