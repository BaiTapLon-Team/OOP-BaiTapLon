package com.baitaplon.objects;


public class SQuestion {
    private String studentID;
    private int questionID;
    private String content;
    private String answer;
    private String correct;

    public SQuestion() {

    }

    public SQuestion ( String studentID, int questionID, String content, String answer, String correct ) {
        this.studentID = studentID;
        this.questionID = questionID;
        this.content = content;
        this.answer = answer;
        this.correct = correct;
    }

    public String getStudentID () {
        return studentID;
    }

    public void setStudentID ( String studentID ) {
        this.studentID = studentID;
    }

    public int getQuestionID () {
        return questionID;
    }

    public void setQuestionID ( int questionID ) {
        this.questionID = questionID;
    }

    public String getContent () {
        return content;
    }

    public void setContent ( String content ) {
        this.content = content;
    }

    public String getAnswer () {
        return answer;
    }

    public void setAnswer ( String answer ) {
        this.answer = answer;
    }

    public String getCorrect () {
        return correct;
    }

    public void setCorrect ( String correct ) {
        this.correct = correct;
    }
}
