<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>

<jsp:directive.include file="../resource-bundles.jsp"/>
<jsp:directive.include file="../delete-status.jsp"/>

<html>
    <head>
        <title><fmt:message bundle="${labels}" key="rights.add.title"/></title>
        <link rel="stylesheet" href="../../css/style.css"/>
    </head>
    <body>
        <form action="post-add.jsp" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>
                            <div class="bold-font">
                            <fmt:message bundle="${labels}" 
                                         key="rights.add.rights.name"/>
                            </div>
                        </td>
                        <td>
                            <input type="text" name="rights" size="20" 
                                   maxlength="20" value="${param.rights}"/>
                        </td>
                        <td>
                            <div class="error-font-color">
                                ${rights_name_error}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="bold-font">
                            <fmt:message bundle="${labels}" 
                                         key="common.status"/>
                            </div>
                        </td>
                        <td>
                            <c:if test='${null == param.deleted && null == rights_status_error}'>
                                <c:set var="check" value='checked="checked"' scope="page"/>
                            </c:if>
                            <c:if test='${null != param.deleted && active == param.deleted}'>
                                <c:set var="check" value='checked="checked"' scope="page"/>
                            </c:if>
                            <input type="radio" name="deleted" value="${active}" 
                                   id="status${active}" ${check}/>
                            <label for="status${active}">
                                <fmt:message bundle="${labels}" 
                                             key="common.active"/>
                            </label>
                            <c:remove scope="page" var="check"/>
                            <c:if test='${null != param.deleted && inactive == param.deleted}'>
                                <c:set var="check" value='checked="checked"' scope="page"/>
                            </c:if>
                            <input type="radio" name="deleted" value="${inactive}" 
                                   id="status${inactive}" ${check}/>
                            <label for="status1">
                                <fmt:message bundle="${labels}" 
                                             key="common.inactive"/>
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
                            [<a href="view-all.jsp"><fmt:message bundle="${labels}" 
                                             key="common.cancel"/></a>]
                        </td>
                        <td>
                            <fmt:message bundle="${labels}" 
                                         key="common.create" 
                                         scope="page" var="txt"/>
                            <input type="submit" value="${txt}"/>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <div class="success-font-color bold-font">${success_msg}</div>
                    <div class="error-font-color bold-font">${error_msg}</div>
                </tfoot>
            </table>
        </form> 
    </body>
</html>