<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="GlobalDeclareNEW.jsp" %>
<%
	String vendordata = null;
	String cityId = request.getParameter("cityListID");
	// System.out.println(":::::::::::::     " + cityId);

	Connection con = ConnectDatabase.getConnection();
	String qry = "SELECT vendor_Id, vendor_name  FROM vendor_city_master  vcm , vendor_Master vm WHERE vcm.vendor_city_id = vm.vendor_city_id AND vm.vendor_city_id = "
			+ cityId;
	// System.out.println("Query city Id     :  " + qry);
	try {
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qry);
		vendordata = "";
		while (rs.next()) {
			vendordata += rs.getInt("vendor_Id") + ":"
					+ rs.getString("vendor_name") + ",";
		}
		rs.close();
		st.close();
		rs = null;
		st = null;
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		con.close();
		con = null;
	}
	// System.out.println("vendordata Set values are ----->" + vendordata);
	out.println(vendordata.trim());
%>