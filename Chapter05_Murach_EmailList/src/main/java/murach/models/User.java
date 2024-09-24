package murach.models;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private Date dateOfBirth;
    private String hearUsOption;
private String contactMeBy;
private boolean isLike;
private boolean isSend;



    public User() {
        hearUsOption = "";
        contactMeBy = "";
        firstName = "";
        lastName = "";
        email = "";
        dateOfBirth = new Date();
        isLike = false;
        isSend = false;
    }

    public User(String firstName, String lastName, String email, Date dateOfBirth, String[] selectedOptions, String hearUsOption, String contactMeBy, boolean isLike, boolean isSend) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.hearUsOption = hearUsOption;
        this.contactMeBy = contactMeBy;
        this.isLike = isLike;
        this.isSend = isSend;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }



    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getHearUsOption() {
        return hearUsOption;
    }

    public void setHearUsOption(String hearUsOption) {
        this.hearUsOption = hearUsOption;
    }

    public boolean Validate() {
        // Validate all property is not empty || null
        if(firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()) {
            return false;
        }
        return true;
    }


    public String getContactMeBy() {
        return contactMeBy;
    }

    public void setContactMeBy(String contactMeBy) {
        this.contactMeBy = contactMeBy;
    }


    public boolean isLike() {
        return isLike;
    }

    public void setLike(boolean like) {
        isLike = like;
    }

    public boolean isSend() {
        return isSend;
    }

    public void setSend(boolean send) {
        isSend = send;
    }
}

