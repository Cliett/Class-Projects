using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Web;

/* RANDALL NOTES
************************Currently just used to generate password hashes*************************
byte[] salt;
new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
System.Security.Cryptography.Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes("Adams", salt, 10000);
byte[] hash = pbkdf2.GetBytes(20);
byte[] hashBytes = new byte[36];
Array.Copy(salt, 0, hashBytes, 0, 16);
Array.Copy(hash, 0, hashBytes, 16, 20);
string savedPasswordHash = Convert.ToBase64String(hashBytes);
userBox.Text = savedPasswordHash; //+ " Salt:" + Convert.ToBase64String(salt);
*************************************************************************************************
*/

namespace AES
{
    public static class Encryption
    {

        public static bool ValidateInput(string input, string hashedInput)
        {
            byte[] hashBytes = Convert.FromBase64String(hashedInput); //from base64(stored as a string) into byte[]
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);
            Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(input, salt, 10000); //Password-Based Key Derivation Function
            byte[] hash = pbkdf2.GetBytes(20); //pseudo-random key for this object.

            for (int i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != hash[i]) //checking each byte. hashBytes starting at index 16. hash starting at index 0
                    return false; //unsuccessful match :(
            }
            return true; //successful match!
        }
    }
}
