package com.baitaplon.objects;

public class SVQuestion {
    private String studentID;
    private String studentName;
    private int scores;

    public SVQuestion () {
    }

    public SVQuestion ( String studentID, String studentName, int scores ) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.scores = scores;
    }

    public String getStudentID () {
        return studentID;
    }

    public void setStudentID ( String studentID ) {
        this.studentID = studentID;
    }

    public String getStudentName () {
        return studentName;
    }

    public void setStudentName ( String studentName ) {
        this.studentName = studentName;
    }

    public int getScores () {
        return scores;
    }

    public void setScores ( int scores ) {
        this.scores = scores;
    }
}
