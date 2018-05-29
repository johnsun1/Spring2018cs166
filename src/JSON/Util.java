package JSON;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import org.json.JSONObject;

public class Util {
	public Util() {
		
	}
	
	/**
	 * Reads g-reCAPTCHA response
	 * Code borrowed from https://codereview.stackexchange.com/questions/181935/server-side-validation-for-recaptcha-v2-or-invisible-recaptcha-with-java-servle/181937
	 * @param secret value submitted from within the form
	 * @param response value sent by Google
	 * @return true or false, depending on if the user passed the captcha
	 */
	public static boolean validateCAPTCHA(String secret, String response) {
		String url = "https://www.google.com/recaptcha/api/siteverify?" 
				+ "secret=" + secret + "&response=" + response;
		try {
			InputStream res = new URL(url).openStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));
			
			StringBuilder sb = new StringBuilder();
			
			int cp;
			while ( (cp = rd.read()) != -1) {
				sb.append((char) cp);
			}
			String jsonText = sb.toString();
			res.close();
			
			JSONObject json = new JSONObject(jsonText);
			
			return json.getBoolean("success");
		} catch (Exception e) {
			
		}
		
		return false;
	}
}
