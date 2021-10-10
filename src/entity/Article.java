package entity;

public class Article extends NewsAPI {
	
	private String id;
	private String name;
	private String author;
	private String title;
	private String description;
	private String url;
	private String urlToImage;
	private String publishedAtDate;
	private String publishedAtTime;
	private String content;
	private String day;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrlToImage() {
		return urlToImage;
	}
	public void setUrlToImage(String urlToImage) {
		this.urlToImage = urlToImage;
	}
	
	public String getPublishedAtDate() {
		return publishedAtDate;
	}
	public void setPublishedAtDate(String publishedAtDate) {
		this.publishedAtDate = publishedAtDate;
	}
	public String getPublishedAtTime() {
		return publishedAtTime;
	}
	public void setPublishedAtTime(String publishedAtTime) {
		this.publishedAtTime = publishedAtTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", name=" + name + ", author=" + author + ", title=" + title + ", description="
				+ description + ", url=" + url + ", urlToImage=" + urlToImage + ", publishedAtDate=" + publishedAtDate
				+ ", publishedAtTime=" + publishedAtTime + ", content=" + content + ", day=" + day + "]";
	}
	
}
