public class createbatchjob implements  Database.Batchable<sObject>, Database.Stateful{
    
    public string Query;
    public Integer recordsProcessed = 0;
    
    public createbatchjob(string q){
        this.Query=q;
        system.debug('query'+query);
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(Query);
    }
    
     public void execute(Database.BatchableContext bc, List<Account> accscope){
        // process each batch of records
         for(Account ac:accscope){
             ac.industry='chemicals';
              recordsProcessed = recordsProcessed + 1;
         }
         
         update accscope;
       
       
    }    
    
     public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         
         system.debug('job is'+job);
         
         
        // call some utility to send email
     //   EmailUtils.sendMessage(job, recordsProcessed);
    }    

}