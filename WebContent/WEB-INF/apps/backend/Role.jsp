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
                    <h2>Role</h2>
                </div>

                <div class="card">
                    <div class="card__header">
                        <h2>List</h2>
                    </div>

                    <div class="card__body">
                        <div class="table-responsive">
                            <table id="data-table-clinc" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th data-column-id="id" data-type="numeric" data-identifier="true" data-width="40px">ID</th>
                                        <th data-column-id="name" data-order="asc">Name</th>
                                        <th data-column-id="commands" data-formatter="commands" data-sortable="false" data-width="120px">Commands</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
			
			<%@ include file="commons/Footer.jsp"%>
            
        </section>
		<%@ include file="commons/JsFiles.jsp"%>
        <!-- jQuery -->
        
        <script src="assets/js/backend/role.js" type="text/javascript">
        	
	        
	       
	        
        </script>
        
    </body>
  </html>