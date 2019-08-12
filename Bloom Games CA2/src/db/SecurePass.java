package db;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

// Class for secure transmission and usage of passwords.

public class SecurePass {
	
	// Main Variables
	private String password;
	private String saltedHash;
	private boolean verify;
	
	// Creation
	public SecurePass(String password) {
		this.password = password;
		this.saltedHash = null;
	}
	
	// Verification
	public SecurePass(String testPassword, String saltedHash) {
		this.password = testPassword;
		this.saltedHash = saltedHash;
	}
	
	// Retrieve Salted Hash
	public String getSaltedHash() {
		if (this.password != null) {
			if (this.saltedHash == null) {
				create();
				return this.saltedHash;
			} else {
				verify();
				if (this.verify) {
					return "true";
				} else {
					return "false";
				}
			}
		} else {
			return "error";
		}
	}
	
	private void create() {
		int iteration = 1000; // Variable
		char[] currpass = this.password.toCharArray();
		byte[] salt = saltGen();
		int length = 32 * 8; // SHA256 Standard
		if (salt != null) {
			try {
				PBEKeySpec keyspec = new PBEKeySpec(currpass, salt, iteration, length);
				SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
				byte[] hash = skf.generateSecret(keyspec).getEncoded();

				// Store iteration so it can be modified in long run for effectiveness
				this.saltedHash = iteration + ":" + length + ":" + bytetohex(salt) + ":" + bytetohex(hash);
			} catch (NoSuchAlgorithmException NASE) {

			} catch (InvalidKeySpecException IKSE) {

			}
		}

		return;
	}

	private void verify() {
		char[] testpass = this.password.toCharArray();
		String[] shadowpt = this.saltedHash.split(":");
		int iteration = Integer.parseInt(shadowpt[0]);
		int length = Integer.parseInt(shadowpt[1]);
		byte[] salt = hextobyte(shadowpt[2]);
		byte[] hash = hextobyte(shadowpt[3]);

		try {
			PBEKeySpec keyspec = new PBEKeySpec(testpass, salt, iteration, length);
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
			byte[] testhash = skf.generateSecret(keyspec).getEncoded();

			int diff = hash.length ^ testhash.length;
			for (int i = 0; i < hash.length && i < testhash.length; i++) {
				diff |= hash[i] ^ testhash[i];
			}

			// Store verification answer for extraction
			this.verify = diff == 0;
		} catch (NoSuchAlgorithmException NASE) {

		} catch (InvalidKeySpecException IKSE) {

		}

		return;
	}

	private byte[] saltGen() {
		// 32 Bytes - 1 Byte = 2 Chars, DB Store 64 Chars
		byte[] saltByte = new byte[32];
		final SecureRandom random = new SecureRandom();
		random.nextBytes(saltByte);
		return saltByte;
	}

	private String bytetohex(byte[] target) {
		// Faster than StringBuilder
		int count = target.length;
		final char[] dict = "0123456789ABCDEF".toCharArray();
		char[] targetStr = new char[count * 2];
		for (int i = 0; i < count; i++) {
			int buff = target[i] & 0xFF;
			targetStr[i * 2] = dict[buff >>> 4];
			targetStr[i * 2 + 1] = dict[buff & 0x0F];
		}
		return new String(targetStr);
	}

	private byte[] hextobyte(String target) {
		int count = target.length();
		byte[] targetByte = new byte[count / 2];
		for (int i = 0; i < count; i += 2) {
			targetByte[i / 2] = (byte) ((Character.digit(target.charAt(i), 16) << 4)
					+ Character.digit(target.charAt(i + 1), 16));
		}
		return targetByte;
	}
	
}
