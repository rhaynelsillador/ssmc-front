<!DOCTYPE html>
<html lang="en">
	<%@ include file="commons/Headers.jsp"%>
    <body>
        <!-- Page Loader -->
        <div id="page-loader">
            <div class="preloader preloader--xl preloader--light">
                <svg viewBox="25 25 50 50">
                    <circle cx="50" cy="50" r="20" />
                </svg>
            </div>
        </div>

        <!-- Header -->
        <%@ include file="commons/Navbar.jsp"%>

        <section id="main">
            
			<%@ include file="commons/MenuAside.jsp"%>
            <%@ include file="commons/Menu.jsp"%>

            <section id="content">
                <div class="content__header">
                    <h2>Accounts</h2>

                    <div class="actions">
                        <a href="AccountAdd"><i class="zmdi zmdi-plus"></i></a>
                    </div>
                </div>

                <div class="card">
                    <div class="card__header">
                        <h2>User Details</h2>
                    </div>

                    <div class="card__body">
                        <div class="table-responsive">
                            <table id="accountsTable" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th data-column-id="id" data-type="numeric" data-identifier="true">ID</th>
                                        <th data-column-id="username">Username</th>
                                        <th data-column-id="name" data-formatter="name">Name</th>
                                        <th data-column-id="mobile">Mobile</th>
                                        <th data-column-id="phone">Phone</th>
                                        <th data-column-id="email">Email</th>
                                        <th data-column-id="birthday">Birthday</th>
                                        <th data-column-id="dateLastLogin" data-order="desc" data-formatter="dateLastLogin">Last Login Date</th>
                                        <th data-column-id="approver"  data-formatter="approver">Approver</th>
                                        <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
                                    </tr>
                                </thead>
                                <!-- <tbody>
                                    <tr>
                                        <td>10250</td>
                                        <td>tim@microsoft.com</td>
                                        <td>26.10.2013</td>
                                    </tr>
                                </tbody> -->
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            <footer id="footer">
                Copyright &copy; 2015 Material Admin

                <ul class="footer__menu">
                    <li><a href="">Home</a></li>
                    <li><a href="">Dashboard</a></li>
                    <li><a href="">Reports</a></li>
                    <li><a href="">Support</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </footer>
        </section>

      
        <!-- Javascript Libraries -->
		<%@ include file="commons/JsFiles.jsp"%>
        <!-- jQuery -->
        <script type="text/javascript">
	        $("#administration_menus").addClass("navigation__sub--active navigation__sub--toggled");
			$("#accounts_menu").addClass("navigation__active");
			var accountsTable = $("#accountsTable");
			var grid = accountsTable.bootgrid({
	        	ajax: true,
	            post: function ()
	            {
	                return {
	                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	                    test: "test"
	                };
	            },
	            url: "AccountList",
	            css: {
	                icon: 'table-bootgrid__icon zmdi',
	                iconSearch: 'zmdi-search',
	                iconColumns: 'zmdi-view-column',
	                iconDown: 'zmdi-sort-amount-desc',
	                iconRefresh: 'zmdi-refresh',
	                iconUp: 'zmdi-sort-amount-asc',
	                dropDownMenu: 'dropdown form-group--select',
	                search: 'table-bootgrid__search',
	                actions: 'table-bootgrid__actions',
	                header: 'table-bootgrid__header',
	                footer: 'table-bootgrid__footer',
	                dropDownItem: 'table-bootgrid__label',
	                table: 'table table-bootgrid',
	                pagination: 'pagination table-bootgrid__pagination'
	            },
	            templates: {
	                actionDropDown: "<span class=\"{{css.dropDownMenu}}\">" + "<a href='' data-toggle=\"dropdown\">{{ctx.content}}</a><ul class=\"{{css.dropDownMenuItems}}\" role=\"menu\"></ul></span>",
	                search: "<div class=\"{{css.search}} form-group\"><span class=\"{{css.icon}} {{css.iconSearch}}\"></span><input type=\"text\" class=\"{{css.searchField}}\" placeholder=\"{{lbl.search}}\" /><i class='form-group__bar'></i></div>",
	                header: "<div id=\"{{ctx.id}}\" class=\"{{css.header}}\"><p class=\"{{css.search}}\"></p><p class=\"{{css.actions}}\"></p></div>",
	                actionDropDownCheckboxItem: "<li><div class='tabe-bootgrid__checkbox checkbox checkbox--dark'><label class=\"{{css.dropDownItem}}\"><input name=\"{{ctx.name}}\" type=\"checkbox\" value=\"1\" class=\"{{css.dropDownItemCheckbox}}\" {{ctx.checked}} /> {{ctx.label}}<i class='input-helper'></i></label></div></li>",
	                footer: "<div id=\"{{ctx.id}}\" class=\"{{css.footer}}\"><div class=\"row\"><div class=\"col-sm-6\"><p class=\"{{css.pagination}}\"></p></div><div class=\"col-sm-6 table-bootgrid__showing hidden-xs\"><p class=\"{{css.infos}}\"></p></div></div></div>"
	            },
	            formatters: {
	                "commands": function(column, row) {
	                	return "<a href=\"AccountUpdate?id="+row.id+"\" class=\"btn btn-sm btn-default command-edit\" data-row-id=\"" + row.id + "\">Edit</a>";
	            	},
	            	"dateLastLogin" : function(column, row){
	            		return moment(row.dateAdded).format("YYYY-MM-DD HH:mm:ss");
	            	} ,
	            	"name" : function(column, row){
	            		return row.lastName +", "+row.firstName;
	            	},
	            	"approver" : function(column, row){
	            		return (row.approver) ? '<span class="approver" data-approver="'+row.approver+'" data-row-id="' + row.id + '"><i class="zmdi zmdi-check-all"></i></span>' : '<span class="approver" data-approver="'+row.approver+'"  data-row-id="' + row.id + '"><i class="zmdi zmdi-close-circle-o"></i></span>';
	            	} 
	        	}
		    }).on("loaded.rs.jquery.bootgrid", function() {
		    	grid.find(".approver").on("click", function(e){
		    		var form = {
	                	id: $(this).data("row-id"),
	                	approver: $(this).data("approver")
	                }
		    		var text = "Do you want to add this account as approver?"
		    		if($(this).data("approver") == true){
		    			text = "Do you want to remove this account as approver?"
		    		}
		    		confirmation({
	                	text : text,
	                	url : "AccountApprover",
	                	form : form,
	                	bootGrid : accountsTable
	                
	                });
		    		        
	  		    }).end().find(".command-delete").on("click", function(e){
	  		    	console.log("You pressed delete on row: " + $(this).data("row-id"));
	  		    });
		    });
			
        </script>
    </body>
  </html>