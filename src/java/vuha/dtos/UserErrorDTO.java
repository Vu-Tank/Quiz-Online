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
public class UserErrorDTO {
    private String emailError;
    private String fullNameError;
    private String passwordError;
    private String roleIDError;
    private String passwordConfirmError;

    public UserErrorDTO() {
    }

    public UserErrorDTO(String emailError, String fullNameError, String passwordError, String roleIDError, String passwordConfirmError) {
        this.emailError = emailError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.roleIDError = roleIDError;
        this.passwordConfirmError = passwordConfirmError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPasswordConfirmError() {
        return passwordConfirmError;
    }

    public void setPasswordConfirmError(String passwordConfirmError) {
        this.passwordConfirmError = passwordConfirmError;
    }
    
}
