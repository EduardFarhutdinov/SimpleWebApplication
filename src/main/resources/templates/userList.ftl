<#import "parts/common.ftl" as c>
<@c.page>
<h1>List of users</h1>

<table class="table table-bordered">
    <thead>
    <tr>
        <th scope="col" >#</th>
        <th scope="col" >Name</th>
        <th scope="col" >Role</th>
        <th scope="col" width="50" >Settings</th>
    </tr>
    </thead>
    <tbody>
<#list users as user>
<tr>
    <td>${user.id}</td>
    <td>${user.username}</td>
    <td><#list user.roles as role>${role}<#sep>, </#list></td>
    <td><a href="/user/${user.id}">edit</a></td>
</tr>
</#list>
</tbody>
</table>
</@c.page>