package entity;

public class NewsAPI {
	
	private String status;
	private String code;
	private String message;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private String totalResults;
	
	
	public String getStatus() {
		return status;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTotalResults() {
		return totalResults;
	}
	public void setTotalResults(String totalResults) {
		this.totalResults = totalResults;
	}
	@Override
	public String toString() {
		return "NewsAPI [status=" + status + ", code=" + code + ", message=" + message + ", totalResults="
				+ totalResults + "]";
	}
	
	
	

}
