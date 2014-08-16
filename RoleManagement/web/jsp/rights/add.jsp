<font color="red">${error}</font>
<font color="green">${success}</font>
<form>
    <table>
        <tr>
            <th>
                Right
            </th>
            <td>
                <input type="text" name="right" size="20" maxlength="20" 
                       value="${param.right}"/>
            </td>
            <td>
                <font color="red">${rightError}</font>
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <input type="radio" name="active" value="true" checked="checked"
                       id="activeTrue"/>
                <label for="activeTrue">Yes</label>
                <input type="radio" name="active" value="false" id="activeFalse"/>
                <label for="activeFalse">No</label>
            </td>
            <td>
                <font color="red">${activeError}</font>
            </td>
        </tr>
        <tr>
            <td>
                [<a href="view-all.jsp">Cancel</a>]
            </td>
            <td>
                <input type="submit" value="Add"/>
            </td>
        </tr>
    </table>
</form>