<jsp:directive.include file="../resource-bundles.jsp"/>

<html>
    <head>
        <title>
            <fmt:message bundle="${labels}" key="rights.add.title"/>
        </title>
    </head>
    <body>
        <form action="post-add.jsp" method="post">
            <table>
                <tr>
                    <th>
                        <fmt:message bundle="${labels}" 
                                     key="rights.add.rights.name"/>
                    </th>
                    <td>
                        <input type="text" name="rights" size="20" maxlength="20" 
                               value="${param.right}"/>
                    </td>
                    <td>
                        <div class="error-font-color">
                            ${rights_name_error}
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <fmt:message bundle="${labels}" 
                                     key="rights.add.rights.status"/>
                    </th>
                    <td>
                        <input type="radio" name="status" value="true" 
                               checked="checked" id="status1"/>
                        <label for="status1">
                            <fmt:message bundle="${labels}" 
                                         key="rights.add.rights.status.active"/>
                        </label>
                        <input type="radio" name="status" value="false" 
                               id="status0"/>
                        <label for="status0">
                            <fmt:message bundle="${labels}" 
                                         key="rights.add.rights.status.inactive"/>
                        </label>
                    </td>
                    <td>
                        <div class="error-font-color">
                            ${rights_status_error}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        [
                        <a href="view-all.jsp">
                            <fmt:message bundle="${labels}" 
                                         key="rights.add.link.cancel.text"/>
                        </a>
                        ]
                    </td>
                    <td>
                        <fmt:message bundle="${labels}" 
                                     key="rights.add.btn.create.text" 
                                     scope="page" var="txt"/>
                        <input type="submit" value="${txt}"/>
                    </td>
                </tr>
            </table>
        </form> 
    </body>
</html>