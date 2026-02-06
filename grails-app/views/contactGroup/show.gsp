<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Group Details</title>
</head>
<body>
    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Group: ${contactGroup.name}</h6>
            </div>
            <div class="card-body">
                <h5>Contacts in this group</h5>
                <hr>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th width="150">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${contactList}" var="contact">
                            <tr>
                                <td class="text-center">
                                    <g:if test="${contact.image}">
                                        <img src="${createLink(controller: 'contact', action: 'displayImage', id: contact.id)}"
                                             style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;">
                                    </g:if>
                                    <g:else>
                                        <span class="text-muted">No Image</span>
                                    </g:else>
                                </td>
                                <td>${contact.contactName}</td>
                                <td>
                                    <g:link controller="contact" action="detail" id="${contact.id}" class="btn btn-info btn-sm">
                                        View Details
                                    </g:link>
                                </td>
                            </tr>
                        </g:each>
                        <g:if test="${!contactList}">
                            <tr>
                                <td colspan="3" class="text-center">No contacts found in this group.</td>
                            </tr>
                        </g:if>
                    </tbody>
                </table>
                <g:link action="index" class="btn btn-secondary">Back to List</g:link>
            </div>
        </div>
    </div>
</body>
</html>