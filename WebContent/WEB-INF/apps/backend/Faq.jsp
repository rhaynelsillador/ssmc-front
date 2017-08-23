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
                    <h2>FAQ</h2>

                    <div class="actions">
                        <a href="FaqCreate"><i class="zmdi zmdi-plus"></i></a>
                    </div>
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
                                        <th data-column-id="id" data-type="numeric" data-identifier="true">ID</th>
                                        <th data-column-id="question" data-order="asc">Question</th>
                                        <th data-column-id="status">Status</th>
                                        <th data-column-id="dateUpdated"  data-formatter="dateUpdated">Date Updated</th>
                                        <th data-column-id="dateAdded"  data-formatter="dateAdded">Date Added</th>
                                        <th data-column-id="commands" data-formatter="commands" data-sortable="false" style="width: 120px">Commands</th>
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
        
        <script src="assets/js/backend/faq.js" type="text/javascript">
        	
	        
	       
	        
        </script>
        
    </body>
  </html>