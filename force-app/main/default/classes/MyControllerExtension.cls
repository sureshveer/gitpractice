public with sharing class MyControllerExtension {
  
    private ApexPages.StandardSetController setController;


    public MyControllerExtension(ApexPages.StandardSetController setController) {
        this.setController = setController;
        
        Account[] records = [SELECT  Name FROM Account LIMIT 30];
     
    }
}