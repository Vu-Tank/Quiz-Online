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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.NamingException;
import vuha.dtos.QuestionChoiceDTO;
import vuha.dtos.QuestionDTO;
import vuha.dtos.QuizDTO;
import vuha.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class QuizDAO {

    public static void createQuiz(QuizDTO quiz) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "insert into tblQuizs(email,subjectID,quizDate,numOfCorrect,numOfQuestion,status)\n"
                        + "values(?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, quiz.getEmail());
                pst.setString(2, quiz.getSubjectID());
                pst.setString(3, quiz.getQuizDate());
                pst.setInt(4, quiz.getNumOfCorrect());
                pst.setInt(5, quiz.getNumOfQuestion());
                pst.setString(6, "out");
                int result = pst.executeUpdate();
                if (result == 1) {
                    sql = "select top 1 quizID\n"
                            + "from tblQuizs\n"
                            + "where email=?\n"
                            + "order by quizID desc";
                    pst = cn.prepareStatement(sql);
                    pst.setString(1, quiz.getEmail());
                    rs = pst.executeQuery();
                    if (rs.next()) {
                        quiz.setQuizID(rs.getString("quizID"));
                    }
                    if (quiz.getQuizID() != null) {
                        for (QuestionDTO question : quiz.getQuestions()) {
                            sql = "insert into tblQuizDetail(quizID,userAnswer,questionID) values(?,?,?)";
                            pst = cn.prepareStatement(sql);
                            pst.setString(1, quiz.getQuizID());
                            pst.setString(2, question.getUserAnswer());
                            pst.setString(3, question.getQuestionID());
                            pst.executeUpdate();
                        }
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

    public static void updateAnswer(String userAnswer, String quizID, String questionID, int numOfCor) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "update tblQuizs\n"
                        + "set numOfCorrect=?\n"
                        + "where quizID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, numOfCor);
                pst.setString(2, quizID);
                pst.executeUpdate();
                sql = "update tblQuizDetail\n"
                        + "set userAnswer=?\n"
                        + "where quizID=? and questionID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, userAnswer);
                pst.setString(2, quizID);
                pst.setString(3, questionID);
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

    public static void updateStatusQuiz(String quizID) throws SQLException, NamingException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "update tblQuizs\n"
                        + "set status='finished'\n"
                        + "where quizID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, quizID);
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

    public static QuizDTO getQuizOut(String email) throws SQLException, NamingException, ParseException {
        QuizDTO quiz = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select top 1 quizID,subjectID,quizDate,numOfQuestion,numOfCorrect\n"
                        + "from tblQuizs\n"
                        + "where status='out' and email=?\n"
                        + "order by quizID desc";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String quizDate = rs.getString("quizDate");
                    int numOfQuestion = rs.getInt("numOfQuestion");
                    int timer = numOfQuestion * 2 * 60;
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date newDate = df.parse(quizDate);
                    Date nowDate = new Date();
                    if (timer - ((nowDate.getTime() - newDate.getTime()) / 1000) > 0) {
                        String subjectID = rs.getString("subjectID");
                        int numOfCorrect = rs.getInt("numOfCorrect");
                        String quizID = rs.getString("quizID");
                        quiz = new QuizDTO(quizID, email, subjectID, quizDate, numOfQuestion, numOfCorrect, null);
                        if (quiz != null) {
                            sql = "select questionID,userAnswer\n"
                                    + "from tblQuizDetail\n"
                                    + "where quizID=?";
                            pst = cn.prepareStatement(sql);
                            pst.setString(1, quizID);
                            rs = pst.executeQuery();
                            ArrayList<QuestionDTO> question = null;
                            while (rs.next()) {
                                String questionID = rs.getString("questionID");
                                String userAnswer = rs.getString("userAnswer");
                                if (question == null) {
                                    question = new ArrayList<>();
                                }
                                question.add(new QuestionDTO(questionID, "", userAnswer, null));
                            }
                            if (question != null) {
                                quiz.setQuestions(question);
                                for (QuestionDTO questionDTO : question) {
                                    sql = "select questionName\n"
                                            + "from tblQuestions\n"
                                            + "where questionID=?";
                                    pst = cn.prepareStatement(sql);
                                    pst.setString(1, questionDTO.getQuestionID());
                                    rs = pst.executeQuery();
                                    if (rs.next()) {
                                        String questionName = rs.getString("questionName");
                                        questionDTO.setQuestionName(questionName);
                                    }
                                    sql = "select choiceID,isRight,answer\n"
                                            + "from tblQuestionChoices\n"
                                            + "where questionID=?\n"
                                            + "order by NEWID()";
                                    pst = cn.prepareStatement(sql);
                                    pst.setString(1, questionDTO.getQuestionID());
                                    rs = pst.executeQuery();
                                    ArrayList<QuestionChoiceDTO> answers = null;
                                    while (rs.next()) {
                                        String choiceID = rs.getString("choiceID");
                                        String answer = rs.getString("answer");
                                        boolean isRight = rs.getBoolean("isRight");
                                        if (answers == null) {
                                            answers = new ArrayList<>();
                                        }
                                        answers.add(new QuestionChoiceDTO(choiceID, questionDTO.getQuestionID(), answer, isRight));
                                    }
                                    questionDTO.setQuestionChoice(answers);
                                }
                            }
                        }
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
        return quiz;
    }

    public static ArrayList<QuizDTO> getQuizHistorys(String email, String subject, int pageSize, int pageIndex) throws SQLException, NamingException {
        ArrayList<QuizDTO> list = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "with x as(select ROW_NUMBER() over (order by quizDate desc ) as r,quizID,quizDate,numOfQuestion,numOfCorrect,status \n"
                        + "from tblQuizs where email=? and subjectID=? )\n"
                        + "select quizID,quizDate,numOfQuestion,numOfCorrect,status from x\n"
                        + "where r between ? and ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, subject);
                pst.setInt(3, (pageIndex * pageSize) - (pageSize - 1));
                pst.setInt(4, pageIndex * pageSize);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String quizID = rs.getString("quizID");
                    String quizDate = rs.getString("quizDate");
                    int numOfQuestion = rs.getInt("numOfQuestion");
                    int numOfCorrect = rs.getInt("numOfCorrect");
                    String status = rs.getString("status");
                    QuizDTO quiz = new QuizDTO(quizID, email, subject, quizDate, numOfQuestion, numOfCorrect, null, status);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(quiz);
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

    public static int countQuizHistory(String subject, String email) throws SQLException, NamingException {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnection();
            if (cn != null) {
                String sql = "select count(quizID) as total\n"
                        + "from tblQuizs\n"
                        + "where email=? and subjectID=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, subject);
                rs = pst.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("total");
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
}
