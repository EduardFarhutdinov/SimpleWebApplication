<#import "parts/common.ftl" as c>
<@c.page>
<h4>USER EDITOR :</h4>

<form action="/user" method="post">

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon3">User name</span>
        </div>
        <input type="text" name="username" value="  ${user.username}">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit">Save</button>
        </div>
    </div>

    <#list roles as role>
    <div>
        <label>
            <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("cheked", "")}>${role}
        </label>
    </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <#--<button type="submit">SAVE</button>-->
</form>
</@c.page>