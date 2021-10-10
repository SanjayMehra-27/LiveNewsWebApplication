package controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewsDAO;
import dao.NewsDAOImp;
import entity.Article;


@WebServlet("/News")
public class ArticleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// Today's Date.
	String date = java.time.LocalDate.now().toString();
   
	// PUT NEWS API KEY Here
	String APIkey = "008606e4b8814c01a71497ce2faf1737";
	
	NewsDAO newsDAO = null;
	RequestDispatcher dispatcher = null;
    public ArticleController() {
       newsDAO = new NewsDAOImp();
        
    }
    
    Article article = new Article();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		todaysTopHeadlines(request,response);
		
		//Category of news
		technologyNews(request,response);
		businessNews(request,response);
		entertainmentNews(request,response);
		generalNews(request,response);
		healthNews(request,response);
		scienceNews(request,response);
		sportsNews(request,response);
		
		System.out.println("STATUS : "+article.getStatus());
		
		dispatcher = request.getRequestDispatcher("/views/News.jsp");
		dispatcher.forward(request, response);
			
	}

	
	private void searchNews(HttpServletRequest request, HttpServletResponse response, String search) {
		
		String url = "http://newsapi.org/v2/everything?q="+search+"&from="+ date + "&sortBy=popularity&apiKey="+APIkey;
		List<Article> searchNews1 = newsDAO.getListNewsArticles(url);
		List<Article> searchNews = getFilteredNews(searchNews1);
		request.setAttribute("searchNews",searchNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
	 
	}


	private void generalNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey="+APIkey;
		List<Article> generalNews1 = newsDAO.getListNewsArticles(url);
		List<Article> generalNews = getFilteredNews(generalNews1);
		request.setAttribute("generalNews",generalNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
	}

	private void scienceNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey="+APIkey;
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> scienceNews = getFilteredNews(filter);
		request.setAttribute("scienceNews",scienceNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
		
	}


	private void healthNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey="+APIkey;
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> healthNews = getFilteredNews(filter);
		request.setAttribute("healthNews",healthNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
		
	}


	private void businessNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey="+APIkey;
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> businessNews = getFilteredNews(filter);
		request.setAttribute("businessNews",businessNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
	}


	private void entertainmentNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey="+APIkey;
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> entertainmentNews = getFilteredNews(filter);

		request.setAttribute("entertainmentNews",entertainmentNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
	}


	private void sportsNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey="+APIkey;
		
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> sportsNews = getFilteredNews(filter);

		request.setAttribute("sportsNews",sportsNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
		
	}


	private void technologyNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey="+APIkey;
		List<Article> filter = newsDAO.getListNewsArticles(url);
		List<Article> technologyNews = getFilteredNews(filter);

		request.setAttribute("technologyNews",technologyNews);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
	}


	private void todaysTopHeadlines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//URL For Today's Top Heading In INDIA
		String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey="+APIkey;
		
		List<Article> listArticlesfilter = newsDAO.getListNewsArticles(url);
	
		List<Article> listArticles = getFilteredNews(listArticlesfilter);

		request.setAttribute("listArticles",listArticles);
		
//		for (Article article : listArticles) {
//			System.out.println(article);
//		}
		
		
		
	}
	

	// This Function removes the null value of content from the list
	private List<Article> getFilteredNews(List<Article> generalNews1) {
		boolean contain = false;
		int index = 0;
		
		
		for (Article article : generalNews1) {
			
			
				
				if (article.getContent().contains("null")) {
					contain = true;
				}

				if (contain) {
					generalNews1.remove(index);
					break;
				}
				index++;
		
		}
		return generalNews1;

	}


	



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
		String search = request.getParameter("search");
		System.out.println(search);
		
		if (!search.isEmpty()) {
			
			searchNews(request,response,search);
			todaysTopHeadlines(request,response);
			
			//Category of news
			technologyNews(request,response);
			businessNews(request,response);
			entertainmentNews(request,response);
			generalNews(request,response);
			healthNews(request,response);
			scienceNews(request,response);
			sportsNews(request,response);
		}
		
		//Test
//		System.out.println("STATUS : "+article.getStatus());
//		System.out.println("SEARCH :"+ request.getParameter("search"));
		
		
		dispatcher = request.getRequestDispatcher("/views/News.jsp");
		dispatcher.forward(request, response);
		
	}

}
