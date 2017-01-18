<cfscript>
    httpMethodKeys = [ 'get','put','post','patch','delete','options','head' ];
</cfscript>
<cfoutput>
    <div id="<%=path["x-resourceId"]%>" class="path-panel panel panel-primary">
        <!--- Path Title --->
        <div class="panel-heading">
            <h3 class="panel-title pathHeader">
                <%=key%> 
                <a class="pull-right btTogglePath" role="button" data-toggle="collapse" href="#panel_<%=path["x-resourceId"]%>" aria-expanded="false" aria-controls="panel_<%=path["x-resourceId"]%>">
                    <i class="fa fa-chevron-down"></i>
                </a>
            </h3>
        </div>

        <!--- Div Content --->
        <div id="panel_<%=path["x-resourceId"]%>" class="collapse panel-body">
            <%= renderXAttributes( path, 'h4' ) %>
            <h4 class="panel-subtitle text-muted">Methods:</h4>
            <div class="col-xs-12">
                <% 
                    _.each( httpMethodKeys, function( methodKey ){ 
                        if( typeof( path[ methodKey ] ) !== 'undefined' ){
                            var methodTemplate = _.template( $( "#method-template" ).html() );
                %>
                    <%= methodTemplate( 
                        {
                            "key":methodKey,
                            "method":path[ methodKey ]
                        } 
                    ) %>
                <%
                        }
                    }) 
                %>
            </div>

        </div>
    </div>
</cfoutput>