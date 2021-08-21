public class apexhelpertask40 {

    public string casenumber{get;set;}
    public List<case> caselist{get;set;}
    public ID x{get;set;}  
    public case c{get;set;}
   
     public String renderingService { get; set; }
 //  public string renderedContentType{get;set;}
    
    public Boolean  tablevisible{get;set;}
     public Boolean  block2visible{get;set;}
    public Boolean  block3visible{get;set;}
    
    
    
    
  
    
    public apexhelpertask40(){
        caselist=new List<case>();
        c=new case();
        tablevisible=false;
        block2visible=false;
        block3visible=false;
    }
        
    
    public pagereference showcases(){
         block2visible=false;
        block3visible=false;
       
        system.debug('casenumber'+casenumber);
        caselist=[select id,CaseNumber,status,subject,type from case where CaseNumber = :casenumber];
        system.debug('checking'+caselist);
        if(caselist.size()>0){
            tablevisible=true;
        }
        return null;
    }
    
    public pagereference editrecord(){
        tablevisible=false;
        block3visible=false;
        block2visible=true;
        
        c=[select id,CaseNumber,status,subject,type from case where id=:x  limit 1];
    
        
        return null;
    }
    
    public pagereference saverecord(){
        
        update c;
        
         tablevisible=false;
        block2visible=false;
        block3visible=true;
       
        return null;
    }
    
    public pagereference renderaspdf(){
        renderingService='pdf';
     //   renderedContentType = 'application/pdf';
    
        return null;
    }
    
      public String renderedFileName { 
        get; 
        set { renderedFileName = this.sanitizeFileName(value); }
    }
    
     public String renderedContentType {
        get {
            String renderedContentType = 'text/html'; // the default
            
            if( ! this.renderingAsHtml() ) {
                // Provides a MIME type for a PDF document 
                renderedContentType = 'application/pdf';
                
                // Add a file name for the PDF file
                if( this.renderedFileName != null) {
                    // This is supposed to set the file name, but it doesn't work
                    renderedContentType += '#' + this.renderedFileName;
                    
                    // This is a work-around to set the file name
                    ApexPages.currentPage().getHeaders().put(
                        'content-disposition', 'attachment; filename=' + 
                         this.renderedFileName);
                }
            }
            
            return renderedContentType;
        }
    }
    
    // Are we rendering to HTML or PDF?
    public Boolean renderingAsHtml() {
        return ( (renderingService == null) || 
                 ( ! renderingService.startsWith('PDF')) );
    }

    // Action method to save (or "print") to PDF
    public PageReference saveToPdf() {
        renderingService = 'PDF';
        return null;
    }
    
    // Private helper -- basic, conservative santization
    
    private String sanitizeFileName(String unsafeName) {
        String allowedCharacters = '0-9a-zA-Z-_.';
        String sanitizedName = 
            unsafeName.replaceAll('[^' + allowedCharacters + ']', '');
        // You might also want to check filename length, 
        // that the filename ends in '.pdf', etc.
        return(sanitizedName);
    }

    
    
}