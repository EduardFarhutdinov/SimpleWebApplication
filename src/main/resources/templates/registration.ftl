<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
Add new User

${message?ifExists}


<@l.login "/registration" true />
</@c.page>