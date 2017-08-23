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
                    <h2>Data Table</h2>

                    <div class="actions">
                        <a href="FaqCreate"><i class="zmdi zmdi-plus"></i></a>
                        <a href=""><i class="zmdi zmdi-trending-up"></i></a>
                        <div class="dropdown">
                            <a href="" data-toggle="dropdown"><i class="zmdi zmdi-more-vert"></i></a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="">Change Date Range</a></li>
                                <li><a href="">Change Graph Type</a></li>
                                <li><a href="">Other Settings</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card__header">
                        <h2>Selection Example <small>Ensure that the data attribute [data-identifier="true"] is set on one column header.</small></h2>
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
        
        <script type="text/javascript">
			$("#dashboard").addClass("navigation__active");
	        
	       
	        
        </script>
        
    </body>
  </html>