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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.NamingException;
import vuha.dtos.QuestionChoiceDTO;
import vuha.dtos.QuestionDTO;
import vuha.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class QuestionDAO {

    public static void insertQuestion(QuestionDTO question) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "insert into tblQuestions(questionName,subjectID,createDate,status) values(?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, question.getQuestionName().trim());
                pst.setString(2, question.getSubjectID());
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String createDate = dateFormat.format(date);
                pst.setString(3, createDate);
                pst.setBoolean(4, question.isStatus());
                int result = pst.executeUpdate();
                if (result == 1) {
                    sql = "select top 1 questionID\n"
                            + "from tblQuestions\n"
                            + "order by questionID desc";
                    pst = cn.prepareStatement(sql);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                        question.setQuestionID(rs.getString("questionID"));
                    }
                    ArrayList<QuestionChoiceDTO> answers = question.getQuestionChoice();
                    for (QuestionChoiceDTO answer : answers) {
                        sql = "insert into tblQuestionChoices(questionID,answer,isRight) values (?,?,?)";
                        pst = cn.prepareStatement(sql);
                        pst.setString(1, question.getQuestionID());
                        pst.setString(2, answer.getAnswer().trim());
                        pst.setBoolean(3, answer.isIsRight());
                        pst.executeUpdate();
                    }
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
    }

    public static int countQuestion(String typeSearch, String searchdata) throws SQLException, NamingException {
        int result = 0;

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select COUNT(questionID) as count\n"
                        + "from tblQuestions\n";
                if (typeSearch.equals("nameType")) {
                    sql = sql + "where questionName like " + "'%" + searchdata + "%'";
                }
                if (typeSearch.equals("subjectType")) {
                    if (!"all".equals(searchdata)) {
                        sql = sql + "where subjectID='" + searchdata + "'";
                    }
                }
                if (typeSearch.equals("statusType")) {
                    if (!"all".equals(searchdata)) {
                        sql = sql + "where status='" + searchdata + "'";
                    }
                }
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("count");
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
        return result;
    }

    public static ArrayList<QuestionDTO> getQuestions(String typeSearch, String searchdata, int pageSize, int pageIndex) throws SQLException, NamingException {
        ArrayList<QuestionDTO> list = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "with x as(select ROW_NUMBER() over (order by subjectID,questionName asc ) as r, questionID,questionName,subjectID,createDate,status \n"
                        + "from tblQuestions \n";
                if (typeSearch.equals("nameType")) {
                    sql = sql + "where questionName like " + "'%" + searchdata + "%'";
                }
                if (typeSearch.equals("subjectType")) {
                    if (!"all".equals(searchdata)) {
                        sql = sql + "where subjectID='" + searchdata + "'";
                    }
                }
                if (typeSearch.equals("statusType")) {
                    if (!"all".equals(searchdata)) {
                        sql = sql + "where status='" + searchdata + "'";
                    }
                }
                sql += ")\n" + "select questionID,questionName,subjectID,createDate,status from x\n"
                        + "where r between ? and ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, (pageIndex * pageSize) - (pageSize - 1));
                pst.setInt(2, pageSize * pageIndex);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionName = rs.getString("questionName");
                    String qsubjectID = rs.getString("subjectID");
                    String createDate = rs.getString("createDate");
                    boolean qstatus = rs.getBoolean("status");
                    QuestionDTO question = new QuestionDTO(questionID, questionName, qsubjectID, createDate, qstatus, null);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(question);
                }
                if (list != null) {
                    for (QuestionDTO questionDTO : list) {
                        ArrayList<QuestionChoiceDTO> answers = null;
                        sql = "select answer,choiceID,isRight\n"
                                + "from tblQuestionChoices\n"
                                + "where questionID=?";
                        pst = cn.prepareStatement(sql);
                        pst.setString(1, questionDTO.getQuestionID());
                        rs = pst.executeQuery();
                        while (rs.next()) {
                            String choiceID = rs.getString("choiceID");
                            String answer = rs.getString("answer");
                            boolean isRight = rs.getBoolean("isRight");
                            QuestionChoiceDTO ans = new QuestionChoiceDTO(choiceID, questionDTO.getQuestionID(), answer, isRight);
                            if (answers == null) {
                                answers = new ArrayList<>();
                            }
                            answers.add(ans);
                        }
                        questionDTO.setQuestionChoice(answers);
                    }
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

    public static void updateStatusQuestion(String questionID, boolean status) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;

        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "update tblQuestions\n"
                        + "set status=?\n"
                        + "where questionID=?";
                pst = cn.prepareStatement(sql);
                pst.setBoolean(1, !status);
                pst.setString(2, questionID);
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

    public static QuestionDTO getQuestion(String questionID) throws SQLException, NamingException {
        QuestionDTO question = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<QuestionChoiceDTO> answers = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select questionName,subjectID,createDate,status\n"
                        + "from tblQuestions\n"
                        + "where questionID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, questionID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String questionName = rs.getString("questionName");
                    String subjectID = rs.getString("subjectID");
                    String createDate = rs.getString("createDate");
                    boolean status = rs.getBoolean("status");
                    question = new QuestionDTO(questionID, questionName, subjectID, createDate, status, null);
                }
                if (question != null) {
                    sql = "select choiceID,isRight,answer\n"
                            + "from tblQuestionChoices\n"
                            + "where questionID=?";
                    pst = cn.prepareStatement(sql);
                    pst.setString(1, questionID);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        String choiceID = rs.getString("choiceID");
                        String answer = rs.getString("answer");
                        boolean isRight = rs.getBoolean("isRight");
                        QuestionChoiceDTO anwer = new QuestionChoiceDTO(choiceID, questionID, answer, isRight);
                        if (answers == null) {
                            answers = new ArrayList<>();
                        }
                        answers.add(anwer);
                    }
                    question.setQuestionChoice(answers);
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
        return question;
    }

    public static void updateQuestion(QuestionDTO question) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "update tblQuestions\n"
                        + "set questionName=?,status=?,subjectID=?\n"
                        + "where questionID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, question.getQuestionName());
                pst.setString(3, question.getSubjectID());
                pst.setBoolean(2, question.isStatus());
                pst.setString(4, question.getQuestionID());
                int result = pst.executeUpdate();
                if (result == 1) {
                    for (QuestionChoiceDTO questionChoiceDTO : question.getQuestionChoice()) {
                        sql = "update tblQuestionChoices\n"
                                + "set answer=?,isRight=?\n"
                                + "where choiceID=?";
                        pst = cn.prepareStatement(sql);
                        pst.setString(1, questionChoiceDTO.getAnswer());
                        pst.setBoolean(2, questionChoiceDTO.isIsRight());
                        pst.setString(3, questionChoiceDTO.getChoiceID());
                        pst.executeUpdate();
                    }
                }
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

    public static ArrayList<QuestionDTO> getQuestionForQuiz(String subjectID, int numOfQuestions) throws SQLException, NamingException {
        ArrayList<QuestionDTO> list = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select top (?) questionID,questionName,createDate\n"
                        + "from tblQuestions\n"
                        + "where subjectID=? and status='false'\n"
                        + "order by newid()";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, numOfQuestions);
                pst.setString(2, subjectID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionName = rs.getString("questionName");
                    String createDate = rs.getString("createDate");
                    QuestionDTO questionDTO = new QuestionDTO(questionID, questionName, subjectID, createDate, false, null, null);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(questionDTO);
                }
                if (list != null) {
                    for (QuestionDTO questionDTO : list) {
                        ArrayList<QuestionChoiceDTO> answers = null;
                        sql = "select choiceID,isRight,answer\n"
                                + "from tblQuestionChoices\n"
                                + "where questionID=?\n"
                                + "order by NEWID()";
                        pst = cn.prepareStatement(sql);
                        pst.setString(1, questionDTO.getQuestionID());
                        rs = pst.executeQuery();
                        while (rs.next()) {
                            String choiceID = rs.getString("choiceID");
                            String answer = rs.getString("answer");
                            boolean isRight = rs.getBoolean("isRight");
                            QuestionChoiceDTO ans = new QuestionChoiceDTO(choiceID, questionDTO.getQuestionID(), answer, isRight);
                            if (answers == null) {
                                answers = new ArrayList<>();
                            }
                            answers.add(ans);
                        }
                        questionDTO.setQuestionChoice(answers);
                    }
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
