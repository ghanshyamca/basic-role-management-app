<%@taglib prefix="sql" uri="/WEB-INF/tld/sql.tld"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>

<c:set var="fileSp" scope="page" value='<%=System.getProperty("file.separator")%>'/>
<c:set value='${pageContext.request.getRealPath("")}' scope="page" var="dbPath"/>
<c:set value='${dbPath}${fileSp}WEB-INF${fileSp}role_management' scope="page" var="dbPath"/>

<sql:setDataSource var="jdbcDsn" driver="org.hsqldb.jdbcDriver" user="SA"
                   password="" scope="page" url="jdbc:hsqldb:file:${dbPath}"/>
