/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.dtos;

/**
 *
 * @author Admin
 */
public class QuestionChoiceDTO {
    private String choiceID;
    private String questionID;
    private String answer;
    private boolean isRight;

    public QuestionChoiceDTO() {
    }

    public QuestionChoiceDTO(String answer, boolean isRight) {
        this.answer = answer;
        this.isRight = isRight;
    }

    public QuestionChoiceDTO(String choiceID, String questionID, String answer, boolean isRight) {
        this.choiceID = choiceID;
        this.questionID = questionID;
        this.answer = answer;
        this.isRight = isRight;
    }
    
    

    public String getChoiceID() {
        return choiceID;
    }

    public void setChoiceID(String choiceID) {
        this.choiceID = choiceID;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean isIsRight() {
        return isRight;
    }

    public void setIsRight(boolean isRight) {
        this.isRight = isRight;
    }

    

    
    
}
