package src;

import java.security.SecureRandom;
import java.util.Random;

public class createPassword
{
  private static final Random RANDOM = new SecureRandom();

  public static final int PASSWORD_LENGTH = 6;

  public String generateRandomPassword()
  {
      
      String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ1234567890&%@"; 
      String pw ="";          
      for (int i=0; i<PASSWORD_LENGTH; i++)
      {
          int index = (int)(RANDOM.nextDouble()*letters.length());
          pw += letters.substring(index, index+1);
      }     
      return pw;
  }
  public static void main(String[] args) 
  {	
	

	
  }
}
