package com.company.myapp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.util.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private String clientKey = "test_ck_MGjLJoQ1aVZpeAPGoBA8w6KYe2RN";
	private String secretKey = "test_sk_7XZYkKL4Mrj1pQ2Y0PWV0zJwlEWR";

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );


		
		return "home";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/story", method = RequestMethod.GET)
	public String story(Locale locale, Model model) {
		return "story";
	}
	
	@SuppressWarnings("unchecked")
    @RequestMapping(value = "/tossApiTestWeb")
    public String tossApiTestWeb(Locale locale, Model model) throws Exception  {
       
        return "tossApiTest";
    }
	
	@SuppressWarnings("unchecked")
	@ResponseBody
    @RequestMapping(value = "/tossSuccess")
    public ModelMap tossSuccess(@RequestParam Map<String, Object> params, ModelMap model) throws Exception  {
       
	    //https://{ORIGIN}/success?amount={AMOUNT}&methodId={METHOD_ID}&orderId={ORDER_ID}&paymentKey={PAYMENT_KEY}

	    System.out.println("tossSuccess!!!!!!!!!!!!!!!!!!!!!!!!!!");
	    
	    
	    String keyBase64 = "Basic " + this.encodeBase64(this.secretKey + ":");

        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", keyBase64);
        
        params.put("customerKey", "1234567890023");
	    
        System.out.println(params);
	    Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = callRestApi2("https://api.tosspayments.com/v1/brandpay/payments/confirm", headers, params, "POST");
        
        System.out.println("*******");
        System.out.println(resultMap);
	    
	    
        return model;
    }
	
	   @SuppressWarnings("unchecked")
	    @ResponseBody
	    @RequestMapping(value = "/tossFail")
	    public ModelMap tossFail(@RequestParam Map<String, Object> params, ModelMap model) throws Exception  {
	       
	        //https://{ORIGIN}/success?amount={AMOUNT}&methodId={METHOD_ID}&orderId={ORDER_ID}&paymentKey={PAYMENT_KEY}

	        System.out.println("tossFail!!!!!!!!!!!!!!!!!!!!!!!!!!");
	        System.out.println(params);
	        
	        
	        return model;
	    }
    
	
	@SuppressWarnings("unchecked")
	@ResponseBody
    @RequestMapping(value = "/callback-auth")
    public ModelMap callback_auth(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
	    
	   System.out.println("callBack!!!!!!!!!!!!!!!!!!!!!!!!!!");
	    String keyBase64 = "Basic " + this.encodeBase64(this.secretKey + ":");

        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", keyBase64);
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        //params.put("custNo", "1234567890");
        //params.put("customerKey", "1234567890000");
        //params.put("scope", "REGISTER");
        paramMap.put("grantType", "AuthorizationCode");
        paramMap.put("customerKey", params.get("customerKey"));
        paramMap.put("code",  params.get("code"));
        
        for (Map.Entry<String, String> entry : params.entrySet()) {
            System.out.println(entry.getKey());
            System.out.println(entry.getValue());
            
            paramMap.put(entry.getKey(), entry.getValue());
        }
        
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap = callRestApi2("https://api.tosspayments.com/v1/brandpay/authorizations/access-token", headers, paramMap, "POST");
        
        System.out.println("*******");
        System.out.println(resultMap);
        model.addAttribute("resultMap", resultMap);
        
        return model;
    }
	
	@SuppressWarnings("unchecked")
    @RequestMapping(value = "/tossApiTest")
    public Map<String, Object> tossApiTest(Locale locale, Model model) throws Exception {
        String resutnStr = "";

		ObjectMapper mapper = new ObjectMapper();


		//String methodType = "POST";
		 String methodType = "GET";

		String schema = "https";
		String uri = "";
		int port = 80;

		String keyBase64 = "Basic " + this.encodeBase64(this.secretKey + ":");

		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Authorization", keyBase64);
		

		String[] scopeArr = new String[] {"CARD"};
		String[] termsIdArr = new String[] {"1"};
		
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("customerKey", "1234567890001");
        params.put("scope", "REGISTER");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String host = "https://api.tosspayments.com";

        resultMap = callRestApi(host+"/v1/brandpay/terms", headers, params, "GET");
        
        resultMap = callRestApi2(host+"/v1/brandpay/terms", headers, params, methodType);
        
        params = new HashMap<String, Object>();
        params.put("customerKey", "1234567890001");
        params.put("scope", scopeArr);
//      //params.put("grantType", "AuthorizationCode");
        params.put("termsId", termsIdArr);
		
		resultMap = callRestApi(host+"/v1/brandpay/terms/agree", headers, params, "POST");
		//resultMap = callRestApi(host+"/v1/brandpay/payments/methods/1234567890000", headers, params, "GET");

		
		
		resultMap = callRestApi2(host+"/v1/brandpay/terms/agree", headers, params, "POST");
		
		
		
	    return resultMap;
    }


    // REST API를 호출하여 결과를 Map에 저장하고 반환하는 메소드
    public Map<String, Object> callRestApi2(String urlStr,  Map<String, String> headers, Map<String, Object> parameters, String httpMethod) throws Exception {

        
        try {
        System.out.println("======callapi start============================================================");
		
        // TLSv1.2를 사용하기 위한 SSLContext를 초기화
       TrustManager[] tm = new TrustManager[] { new X509TrustManager() {
           public java.security.cert.X509Certificate[] getAcceptedIssuers() {
               return null;
           }
           public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType) {
           }
           public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType) {
           }
       } };
        
        //System.setProperty("https.protocols", "TLSv1.2");
		SSLContext sc = SSLContext.getInstance("TLSv1.2");
        sc.init(null, null, new java.security.SecureRandom());
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

        // URL 객체 생성
        URL url = new URL(urlStr);
        
        // GET 방식일 경우 URL 뒤에 파라미터 추가
        if ("GET".equalsIgnoreCase(httpMethod) && parameters != null) {
            StringBuilder sb2 = new StringBuilder(urlStr);
            sb2.append("?");
            for (Map.Entry<String, Object> entry : parameters.entrySet()) {
                sb2.append(entry.getKey());
                sb2.append("=");
                sb2.append(entry.getValue());
                sb2.append("&");
            }
            url = new URL(sb2.toString());
        }

        // HttpURLConnection 객체 생성
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

        // httpMethod에 따라 요청 메소드 설정
        conn.setRequestMethod(httpMethod);
        conn.setConnectTimeout(10000); // 커넥션 timeout 10초
        conn.setReadTimeout(5000); //컨텐츠 조회시 timeout 5초
        
        conn.setDoOutput(true); //항상 갱신된 내용 가져오도록 true로 설정
        
        // headers에 있는 키-값 쌍을 모두 요청 헤더에 추가
        if (headers != null) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                System.out.println(entry.getKey());
                System.out.println(entry.getValue());
                conn.setRequestProperty(entry.getKey(), entry.getValue());
            }
        }

        if ("POST".equalsIgnoreCase(httpMethod)) { // POST 방식일 경우 요청 바디에 파라미터 추가
            conn.setRequestProperty("Content-Type", "application/json");
            
			ObjectMapper mapper = new ObjectMapper();

            conn.setDoOutput(true);

            OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
            osw.write(mapper.writeValueAsString(parameters));
            osw.flush();
            osw.close();
        }
        
        
        //System.out.println(conn.getResponseMessage());

        BufferedReader br = null;
        
        // 응답 코드가 200번대가 아닌 경우 예외 발생
        if (conn.getResponseCode() / 100 != 2) {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            String strCurrentLine;
                while ((strCurrentLine = br.readLine()) != null) {
                       System.out.println(strCurrentLine);
                }
            
            throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
        }

        // 응답 데이터를 읽어들이기 위한 BufferedReader 객체 생성
       br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

        // 응답 데이터를 저장하기 위한 StringBuilder 객체 생성
        StringBuilder sb = new StringBuilder();
        String output;
        while ((output = br.readLine()) != null) {
            sb.append(output);
        }
        
        // 연결 해제
        conn.disconnect();

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", sb);
		
        System.out.println(resultMap);
        System.out.println("======callapi end============================================================");
		return resultMap;
		
        } catch (Exception e) {
            System.out.println(e);
            throw new Exception();
        }
	}

    public Map<String, Object> callRestApi(String urlStr,  Map<String, String> headers, Map<String, Object> paramMap, String httpMethod) throws Exception {
        
        try {
            System.out.println("======callapi start============================================================");
            
            String resultStr = "";

            TrustManager[] tm = new TrustManager[] { new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
                public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType) {
                }
                public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType) {
                }
            } };
             
             System.setProperty("https.protocols", "TLSv1.2");
             SSLContext sc = SSLContext.getInstance("TLS");
             sc.init(null, null, new java.security.SecureRandom());
             HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
            
            CloseableHttpClient client = null;
            CloseableHttpResponse httpResponse = null;
            
            ObjectMapper mapper = new ObjectMapper();

            RequestConfig requestConfig = RequestConfig.custom()
            .setConnectTimeout(1000)
            .setSocketTimeout(1000)
            .setConnectTimeout(1000)
            .build();

            HttpClientBuilder httpClientBuilder = HttpClients.custom().setDefaultRequestConfig(requestConfig);
            client = httpClientBuilder.build();

            URIBuilder uriBuilder = new URIBuilder(urlStr);

            String param = mapper.writeValueAsString(paramMap);
            StringEntity paramEntity = new StringEntity(param, ContentType.APPLICATION_JSON);
            System.out.println("params=====" +  param);
            System.out.println("paramEntity=====" +  paramEntity);
            
            HttpRequestBase httpsend = null;

            if ("GET".equals(httpMethod)) {
                for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
                   
                    uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
                }

                httpsend = new HttpGet(uriBuilder.build().toString());
            } else {
                HttpPost httpPost = new HttpPost(uriBuilder.build().toString());
                httpPost.setEntity(paramEntity);
                httpsend = httpPost;
                httpsend.addHeader("Content-Type", "application/json");
            }
            
            System.out.println("url========"+httpsend.getURI());
    
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    System.out.println("headers =====" + entry.getKey() + ":" +entry.getValue());
                    httpsend.addHeader(entry.getKey(), entry.getValue());
                }
            }

            httpResponse = client.execute(httpsend);

            System.out.println("status code : " + httpResponse.getStatusLine().getStatusCode());
            System.out.println("status msg : " + httpResponse.getStatusLine().getReasonPhrase());
            
            resultStr = EntityUtils.toString(httpResponse.getEntity(), Charset.forName("UTF-8"));
            
            
        
            Map<String, Object> resultMap = new HashMap<String, Object>();
            resultMap.put("result", resultStr);
            
            System.out.println(resultStr);
            System.out.println("======callapi end============================================================");
            return resultMap;
        
        } catch (Exception e) {
            System.out.println(e);
            throw new Exception();
        }
    }

	public String encodeBase64(String input) {
        try {
            byte[] bytes = input.getBytes("UTF-8");
            byte[] encodedBytes = Base64.encodeBase64(bytes);
            return new String(encodedBytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}
