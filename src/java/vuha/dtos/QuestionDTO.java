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
public class QuestionDTO {
    private String questionID;
    private String questionName;
    private String subjectID;
    private String createDate;
    private boolean status;
    private String userAnswer;
    private ArrayList<QuestionChoiceDTO> questionChoice;

    public QuestionDTO(String questionName, String subjectID, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionName = questionName;
        this.subjectID = subjectID;
        this.questionChoice = questionChoice;
    }

    public QuestionDTO(String questionName, String subjectID, boolean status, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionName = questionName;
        this.subjectID = subjectID;
        this.status = status;
        this.questionChoice = questionChoice;
    }

    public QuestionDTO(String questionID, String questionName, String subjectID, boolean status, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionID = questionID;
        this.questionName = questionName;
        this.subjectID = subjectID;
        this.status = status;
        this.questionChoice = questionChoice;
    }
    

    public QuestionDTO(String questionID, String questionName, String subjectID, String createDate, boolean status, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionID = questionID;
        this.questionName = questionName;
        this.subjectID = subjectID;
        this.createDate = createDate;
        this.status = status;
        this.questionChoice = questionChoice;
    }

    public QuestionDTO(String questionID, String questionName, String subjectID, String createDate, boolean status, String userAnswer, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionID = questionID;
        this.questionName = questionName;
        this.subjectID = subjectID;
        this.createDate = createDate;
        this.status = status;
        this.userAnswer = userAnswer;
        this.questionChoice = questionChoice;
    }

    public QuestionDTO(String questionID, String questionName, String userAnswer, ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionID = questionID;
        this.questionName = questionName;
        this.userAnswer = userAnswer;
        this.questionChoice = questionChoice;
    }

    
    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    
    
    
    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<QuestionChoiceDTO> getQuestionChoice() {
        return questionChoice;
    }

    public void setQuestionChoice(ArrayList<QuestionChoiceDTO> questionChoice) {
        this.questionChoice = questionChoice;
    }
}
