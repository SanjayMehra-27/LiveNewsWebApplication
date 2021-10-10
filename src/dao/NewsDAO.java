package dao;

import java.util.List;

import entity.Article;

public interface NewsDAO {

	List<Article> getListNewsArticles(String url);

}
