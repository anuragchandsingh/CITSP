package com.citsp.pass;

import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;

public class Generate {
 public static String password() {  
         
		 // create character rule for lower case  
	       // CharacterRule LCR = new CharacterRule(EnglishCharacterData.LowerCase);  
	        // set number of lower case characters  
	       // LCR.setNumberOfCharacters(2);  
	  
	        // create character rule for upper case  
	        CharacterRule UCR = new CharacterRule(EnglishCharacterData.UpperCase);  
	        // set number of upper case characters  
	        UCR.setNumberOfCharacters(4);  
	  
	        // create character rule for digit  
	        CharacterRule DR = new CharacterRule(EnglishCharacterData.Digit);  
	        // set number of digits  
	        DR.setNumberOfCharacters(4);  
	  
	        // create character rule for lower case  
	        //CharacterRule SR = new CharacterRule(EnglishCharacterData.Special);  
	        // set number of special characters  
	        //SR.setNumberOfCharacters(2);  
	          
	        // create instance of the PasswordGenerator class   
	        PasswordGenerator passGen = new PasswordGenerator();  
	          
	        // call generatePassword() method of PasswordGenerator class to get Passay generated password  
	        String password = passGen.generatePassword(8, UCR, DR);  
	          
	        // return Passay generated password to the main() method   
	        return password;  
	    }  
	 
	 public static String id() {  
         
	        // create character rule for lower case  
	       // CharacterRule LCR = new CharacterRule(EnglishCharacterData.LowerCase);  
	        // set number of lower case characters  
	       // LCR.setNumberOfCharacters(2);  
	  
	        // create character rule for upper case  
	       // CharacterRule UCR = new CharacterRule(EnglishCharacterData.UpperCase);  
	        // set number of upper case characters  
	       // UCR.setNumberOfCharacters(4);  
	  
	        // create character rule for digit  
	        CharacterRule DR = new CharacterRule(EnglishCharacterData.Digit);  
	        // set number of digits  
	        DR.setNumberOfCharacters(4);  
	  
	        // create character rule for lower case  
	        //CharacterRule SR = new CharacterRule(EnglishCharacterData.Special);  
	        // set number of special characters  
	        //SR.setNumberOfCharacters(2);  
	          
	        // create instance of the PasswordGenerator class   
	        PasswordGenerator passGen = new PasswordGenerator();  
	          
	        // call generatePassword() method of PasswordGenerator class to get Passay generated password  
	        String password = passGen.generatePassword(4, DR);  
	          
	        // return Passay generated password to the main() method   
	        return password;  
	    }  
	

}
