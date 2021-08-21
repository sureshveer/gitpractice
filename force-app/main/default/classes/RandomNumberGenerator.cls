public with sharing class RandomNumberGenerator {
    public static String randomNumber;
    
    public static String generateRandomNumber() {
        randomNumber = generate();
        /*  system.debug('randomNumber4' +randomNumber);
system.debug('random length5'+randomNumber.length());
if (randomNumber.length() < 6) {
String randomNumber2 = generate();
randomNumber = randomNumber + randomNumber2.substring(0, 10 - randomNumber.length());
}*/
        randomNumber= randomNumber.substring(0, 5);
        randomNumber='GT'+'-'+randomNumber;
        system.debug(randomNumber);
        system.debug(randomNumber.length());
        
        return randomNumber;
    }
    public static String generateIdentifier() {
        return  generateRandomNumber();
    }
    private static String generate() {
        // system.debug('generate19'+String.valueOf(Math.abs(Crypto.getRandomInteger())));
        return String.valueOf(Math.abs(Crypto.getRandomInteger()));
        
    }
    
    public static void sendingEmail()
    {
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
        
        String[] sendingTo = new String[]{'svsuresh8@gmail.com'}; 
            semail.setToAddresses(sendingTo); 
        String randomNumber=generateRandomNumber();
        semail.setSubject('Verification  code '); 
        semail.setPlainTextBody('Verification  code is'+randomNumber);
          semail.setHtmlBody('Your randomNumber:<b> ' +randomNumber  +' </b>has been created.<p>'+ 'To view your case <a >click here...</a></p>');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
        
             
    } 
}