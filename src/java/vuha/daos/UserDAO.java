/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.daos;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import vuha.dtos.UserDTO;
import vuha.utils.DBUtil;
import vuha.utils.MyUtil;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public static void insertNewUser(UserDTO uer) throws SQLException, NamingException, NoSuchAlgorithmException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "insert into tblUsers(email,fullName,password,roleID,status) values (?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, uer.getEmail());
                pst.setString(2, uer.getFullName());
                uer.setPassword(MyUtil.getSHA(uer.getPassword()));
                pst.setString(3, uer.getPassword());
                pst.setString(4, uer.getRoleID());
                pst.setString(5, uer.getStatus());
                pst.executeUpdate();
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
    }

    public static UserDTO checkLogin(String email, String password) throws SQLException, NamingException, NoSuchAlgorithmException {
        UserDTO user = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select fullName,roleID,status\n"
                        + "from tblUsers\n"
                        + "where email=? and password=?";
                pst=cn.prepareStatement(sql);
                pst.setString(1, email);
                password=MyUtil.getSHA(password);
                pst.setString(2, password);
                rs=pst.executeQuery();
                if(rs.next()){
                    String fullName=rs.getString("fullName");
                    String roleID=rs.getString("roleID");
                    String status=rs.getString("status");
                    user=new UserDTO(email, fullName, roleID, status);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return user;
    }
}
