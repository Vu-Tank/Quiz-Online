/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import vuha.dtos.SubjectDTO;
import vuha.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class SubjectDAO {

    public static ArrayList<SubjectDTO> getListSubjects() throws SQLException, NamingException {
        ArrayList<SubjectDTO> list = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select subjectID,subjectName\n"
                        + "from tblSubjects";
                pst=cn.prepareStatement(sql);
                rs=pst.executeQuery();
                while(rs.next()){
                    String subjectID=rs.getString("subjectID");
                    String subjectName=rs.getString("subjectName");
                    SubjectDTO subject=new SubjectDTO(subjectID, subjectName);
                    if(list==null)
                        list=new ArrayList<>();
                    list.add(subject);
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

        return list;
    }
}
