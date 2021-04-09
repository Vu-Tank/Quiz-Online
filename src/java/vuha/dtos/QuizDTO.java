/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.dtos;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class QuizDTO {
    private String quizID;
    private String email;
    private String subjectID;
    private String quizDate;
    private int numOfQuestion;
    private int numOfCorrect;
    ArrayList<QuestionDTO> questions;
    private String status;

    public QuizDTO(String quizID, String email, String subjectID, String quizDate, int numOfQuestion, int numOfCorrect, ArrayList<QuestionDTO> questions) {
        this.quizID = quizID;
        this.email = email;
        this.subjectID = subjectID;
        this.quizDate = quizDate;
        this.numOfQuestion = numOfQuestion;
        this.numOfCorrect = numOfCorrect;
        this.questions = questions;
    }

    public QuizDTO(String quizID, String email, String subjectID, String quizDate, int numOfQuestion, int numOfCorrect, ArrayList<QuestionDTO> questions, String status) {
        this.quizID = quizID;
        this.email = email;
        this.subjectID = subjectID;
        this.quizDate = quizDate;
        this.numOfQuestion = numOfQuestion;
        this.numOfCorrect = numOfCorrect;
        this.questions = questions;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public String getQuizID() {
        return quizID;
    }

    public void setQuizID(String quizID) {
        this.quizID = quizID;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getQuizDate() {
        return quizDate;
    }

    public void setQuizDate(String quizDate) {
        this.quizDate = quizDate;
    }

    public int getNumOfQuestion() {
        return numOfQuestion;
    }

    public void setNumOfQuestion(int numOfQuestion) {
        this.numOfQuestion = numOfQuestion;
    }

    public int getNumOfCorrect() {
        return numOfCorrect;
    }

    public void setNumOfCorrect(int numOfCorrect) {
        this.numOfCorrect = numOfCorrect;
    }

    public ArrayList<QuestionDTO> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<QuestionDTO> questions) {
        this.questions = questions;
    }
    
}
