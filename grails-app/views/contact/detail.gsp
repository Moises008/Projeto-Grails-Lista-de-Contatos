<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        Contact Detail
    </div>

    <div class="card-body">
        <div class="row">
            <div class="col-md-3">
                <div class="card p-3 shadow-sm text-center">
                    <g:if test="${contact.image}">
                        <img src="${createLink(controller: 'contact', action: 'displayImage', id: contact.id)}" class="img-fluid rounded"/>
                    </g:if>
                    <g:else>
                        <g:img dir="images" file="grails.svg" class="img-fluid" style="max-height: 150px;"/>
                    </g:else>
                    <div class="mt-3 text-left">
                        <p><strong>Name:</strong> ${contact.contactName}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-9">
                <div class="row">
                    <g:if test="${contact?.details}">
                        <g:each in="${contact.details}" var="info">
                            <div class="col-md-4 mb-4">
                                <div class="card h-100 shadow-sm detail-card">
                                    <div class="card-header text-uppercase small font-weight-bold">
                                        Type: ${info.type ?: 'General'}
                                    </div>
                                    <ul class="list-group list-group-flush custom-list">
                                        <li class="list-group-item small"><b>Mobile:</b> ${info.mobileNumber ?: info.mobile ?: 'N/A'}</li>
                                        <li class="list-group-item small"><b>Phone:</b> ${info.phoneNumber ?: info.phone ?: 'N/A'}</li>
                                        <li class="list-group-item small"><b>Email:</b> ${info.email ?: 'N/A'}</li>
                                        <li class="list-group-item small"><b>Web:</b> ${info.website ?: 'N/A'}</li>
                                        <li class="list-group-item small"><b>Address:</b> ${info.address ?: 'N/A'}</li>
                                    </ul>
                                </div>
                            </div>
                        </g:each>
                    </g:if>
                    <g:else>
                        <div class="col-12">
                            <p class="text-muted">Nenhum detalhe encontrado para este contato.</p>
                        </div>
                    </g:else>
                </div>
            </div>
        </div>
    </div>

    <div class="card-footer">
        <g:link action="index" class="btn btn-primary shadow-sm">Cancel</g:link>
    </div>
</div>