public class popupenable {

    public string callfunc{get;set;}
    
 
    public popupenable()

{

callfunc='<script> func(); </script>';
system.debug('func'+callfunc);
}
}