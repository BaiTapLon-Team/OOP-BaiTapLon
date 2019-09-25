package com.baitaplon.objects;

public class Question {
    private int questionID;
    private String content;
    private String correct;
    private String answerA;
    private String answerB;
    private String answerC;
    private String answerD;

    public Question() {

    }

    public Question ( int questionID, String content, String correct, String anwserA,
                      String anwserB, String anwserC, String anwserD ) {
        this.questionID = questionID;
        this.content = content;
        this.correct = correct;
        this.answerA = anwserA;
        this.answerB = anwserB;
        this.answerC = anwserC;
        this.answerD = anwserD;
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

    public String getCorrect () {
        return correct;
    }

    public void setCorrect ( String correct ) {
        this.correct = correct;
    }

    public String getAnwserA () {
        return answerA;
    }

    public void setAnwserA ( String anwserA ) {
        this.answerA = anwserA;
    }

    public String getAnwserB () {
        return answerB;
    }

    public void setAnwserB ( String anwserB ) {
        this.answerB = anwserB;
    }

    public String getAnwserC () {
        return answerC;
    }

    public void setAnwserC ( String anwserC ) {
        this.answerC = anwserC;
    }

    public String getAnwserD () {
        return answerD;
    }

    public void setAnwserD ( String anwserD ) {
        this.answerD = anwserD;
    }
}
