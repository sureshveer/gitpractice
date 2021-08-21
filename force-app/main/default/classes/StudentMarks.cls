public class StudentMarks {

    private double englishmarks;
    private double telugumarks;
    private double hindimarks;
    private double sciencemarks;
    private double socialmarks;
    private double mathsmarks;
    
    public StudentMarks(double englishmarks,double telugumarks,double hindimarks,double sciencemarks,double socialmarks,double mathsmarks){
        
        this.englishmarks=englishmarks;
        this.telugumarks=telugumarks;
        this.hindimarks=hindimarks;
        this.sciencemarks=sciencemarks;
        this.socialmarks=socialmarks;
        this.mathsmarks=mathsmarks;
        
    }
    
     //setters and getters
     public void setEnglishmarks(double englishmarks)
       {
         this.englishmarks = englishmarks;
       }
     public double getEnglishmarks()
       {
         return englishmarks;
       }
    
    
     public void setTelugumarks(double telugumarks)
       {
         this.telugumarks = telugumarks;
       }
     public double getTelugumarks()
       {
         return telugumarks;
       }
    
     public void setHindimarks(double hindimarks)
       {
         this.hindimarks = hindimarks;
       }
     public double getHindimarks()
       {
         return hindimarks;
       }

    
     public void setSciencemarks(double sciencemarks)
       {
         this.sciencemarks = sciencemarks;
       }
     public double getSciencemarks()
       {
         return sciencemarks;
       }
    
     public void setSocialmarks(double socialmarks)
       {
         this.socialmarks = socialmarks;
       }
     public double getSocialmarks()
       {
         return socialmarks;
       }
    
     public void setMathsmarks(double mathsmarks)
       {
         this.mathsmarks = mathsmarks;
       }
     public double getMathsmarks()
       {
         return mathsmarks;
       }

}