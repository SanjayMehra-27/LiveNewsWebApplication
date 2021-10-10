package dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.json.JSONArray;
import org.json.JSONObject;

import entity.Article;
import entity.NewsAPI;

public class NewsDAOImp implements NewsDAO{

	// Obtains The News From NEWS API Server
	@Override
	public List<Article> getListNewsArticles(String url) {
	
		Article article = null;
		List<Article> listArticles = null;
		
		
		
		
		try {
			
			//URL Connection
			URL urlObj = new URL(url);
			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
			
			//Response code
			int ResponseCode =	con.getResponseCode();
			
			
			
			//Test
			System.out.println("URL :"+url);
			System.out.println("ResponseCode : "+ResponseCode);
			
			
			
			// Check ResponseCode is Correct Or not
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			String inputString;
			
			StringBuffer response1 = new StringBuffer();
			
			while ((inputString = in.readLine()) != null) {
				
				response1.append(inputString);			
			}
			
			in.close();
			
//			System.out.println(response.toString());
//			JSONArray jsonArray = new JSONArray(response.toString());
			
			JSONObject jsonObject = new JSONObject(response1.toString());
			
			if (ResponseCode == 200) {
			
			listArticles = new ArrayList<Article>();
			
			
			
//			// Set Status and totalResults
//			article.setStatus(jsonObject.get("status").toString());
//			article.setTotalResults(jsonObject.get("totalResults").toString());
//			
//			//Test
//			System.out.println("Status :"+jsonObject.get("status"));
//			System.out.println("totalResults :"+jsonObject.get("totalResults"));
			
			// JSON Object To JSON array
			JSONArray jsonArray = jsonObject.getJSONArray("articles");
			//Test
			System.out.println("Article Length :"+jsonArray.length());
			
				
				
				
				for (int i = 0; i < jsonArray.length(); i++) {
					
					article = new Article();
					
					article.setTitle(jsonObject.getJSONArray("articles").getJSONObject(i).get("title").toString());
					article.setAuthor(jsonObject.getJSONArray("articles").getJSONObject(i).get("author").toString());
					article.setContent(jsonObject.getJSONArray("articles").getJSONObject(i).get("content").toString());
					article.setName(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("name").toString());
					article.setId(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("id").toString());
					article.setDescription(jsonObject.getJSONArray("articles").getJSONObject(i).get("description").toString());
					article.setUrl(jsonObject.getJSONArray("articles").getJSONObject(i).get("url").toString());
					article.setUrlToImage(jsonObject.getJSONArray("articles").getJSONObject(i).get("urlToImage").toString());
					
					try {
						
					
					//Split publishedAt Into Time & Date
					String[] dateAndtimeArr = UTCdateconvert(jsonObject.getJSONArray("articles").getJSONObject(i).get("publishedAt").toString());
					
					
					
					//Date , Day , Time	
					article.setPublishedAtDate(dateAndtimeArr[0]);
					article.setPublishedAtTime(dateAndtimeArr[1]);
					
					
					} catch (Exception e) {
						e.getStackTrace();
					}
					//Test
					System.out.println("\n-----------ARTICLE--------- "+i+"\n");
//					System.out.println("Source Name : "+jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("name"));
//					System.out.println("Author : "+jsonObject.getJSONArray("articles").getJSONObject(i).get("author"));
//					System.out.println("Title : "+jsonObject.getJSONArray("articles").getJSONObject(i).get("title"));
//					System.out.println("Description : "+jsonObject.getJSONArray("articles").getJSONObject(i).get("description"));
					System.out.println("Url : "+jsonObject.getJSONArray("articles").getJSONObject(i).get("url"));
//					System.out.println("Content : "+jsonObject.getJSONArray("articles").getJSONObject(i).get("content"));
//					
					listArticles.add(article);
					
					
					
				}
				
			}
			
			
			
			} catch (Exception e) {
				System.out.println();
				e.getStackTrace();
			}
		
		return listArticles;
	}

	private String[] UTCdateconvert(String utcDate) throws ParseException {
		String[] dateAndTime = new String[2];

		try {
			
		Instant s = Instant.parse(utcDate);
        ZoneId.of("Asia/Kolkata");
        LocalDateTime l = LocalDateTime.ofInstant(s, ZoneId.of("Asia/Kolkata"));
        
        System.out.println("LOCAL: "+l.toLocalDate().getDayOfMonth()+"-"+l.toLocalDate().getMonth()+"-"+l.toLocalDate().getYear()+"-"+l.toLocalDate().getDayOfWeek());
        
        
        String date = l.toLocalDate().getDayOfMonth()+"-"+l.toLocalDate().getMonth()+"-"+l.toLocalDate().getYear();
		
		String time = l.toLocalTime().of(l.getHour(), l.getMinute()).toString();
		//test
//		System.out.println("NEW TIME : "+l.toLocalTime().of(l.getHour(), l.getMinute()).toString());
		
		
		//Convert Time Into 12Hour Format AM/PM
		if (l.getHour() >= 12  && l.getMinute() > 0) {
			int i = l.getHour() - 12;
			if (i == 0) {
				i = 12;
			}
			time = l.toLocalTime().of(i, l.getMinute()).toString()+" "+"PM";
		}else {
			time  = time+" "+"AM";
		}
		System.out.println(time);
		
		//SET
		
		dateAndTime[0] = date;
		dateAndTime[1] = time;
		
		
		
		
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return dateAndTime;
	}

}
