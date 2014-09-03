<jsp:directive.include file="../jdbc-dsn.jsp"/>
<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" 
                     key="user.groups.rights.view.all.page.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>
        <p>
            Search pending ...
        </p>
        <jsp:directive.include file="../view-all-status-filter.jsp"/>
    </body>
</html>