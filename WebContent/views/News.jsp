<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous" type="text/javascript"></script>

<title>LIVE NEWS WEB APPLICATION</title>
</head>


<link href="views/css/news.css" rel="stylesheet">


<body>




	<header>
		<div class="container">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-white shadow-md mt-2">
				<div class="container-fluid">
					<a class="navbar-brand navbar-text"
						href="${pageContext.request.contextPath}/News"> <strong>LIVE
							NEWS WEB APPLICATION </strong>
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>

						<form class="d-flex" method="post"
							action="${pageContext.request.contextPath}/News?#search">
							<input class="form-control me-2" required="required"
								type="search" placeholder="Search" name="search"
								aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</div>


	</header>

	<section class="jumbotron bg-dark m-3 p-2 rounded-2 fixed">

		<div class="row gy-2 gx-3 align-items-center">
			<div id="carouselExampleCaptions" class="carousel slide center"
				data-bs-ride="carousel">
				<ol class="carousel-indicators">
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
						class="active"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7"></li>
					<li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="8"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://image.freepik.com/free-vector/stylish-happy-new-year-minimal-style-banner_1017-29310.jpg"
							class="d-block" alt="..." style="visibility: hidden;">
						<div class="carousel-caption d-none d-md-block"></div>
					</div>

					<h5 class="text-muted">Today's Top Headlines</h5>
					<c:forEach items="${listArticles}" var="article">
						<div class="carousel-item">


							<div class="card">



								<img src="${article.urlToImage }" class="d-block img-fuide"
									alt="Image">

								<div class="carousel-caption d-none d-md-block">

									<h5>${article.title }</h5>
									<p>${article.description }</p>

									<p class="fw-bold text-small text-center badge bg-dark ">
										${article.publishedAtDate} <span
											class="badge  bg-dark  float-end">${article.name}</span>
										${article.publishedAtTime}
									</p>
									<a target="_blank" href="${article.url}/"
										class="btn btn-primary btn-sm btn-center d-block"> <strong
										class=""> Read More </strong>
									</a>

								</div>

							</div>


						</div>
					</c:forEach>

				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-bs-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-bs-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
				</a>
			</div>
		</div>

	</section>

	<section class="bg-dark p-5 m-3 rounded-2">
		<header> </header>


		<article>

			<ul class="nav nav-tabs " id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light active" id="home-tab"
					data-bs-toggle="tab" href="#TECHNOLOGY" role="tab"
					aria-controls="home" aria-selected="true">TECHNOLOGY NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#BUSINESS" role="tab" aria-controls="profile"
					aria-selected="false">BUSINESS NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#SPORTS" role="tab" aria-controls="profile"
					aria-selected="false">SPORTS NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#SCIENCE" role="tab" aria-controls="profile"
					aria-selected="false">SCIENCE NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#HEALTH" role="tab" aria-controls="profile"
					aria-selected="false">HEALTH NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#ENTERTAINMENT" role="tab" aria-controls="profile"
					aria-selected="false">ENTERTAINMENT NEWS</a></li>
				<li class="nav-item" role="presentation"><a
					class="nav-link link-light" id="profile-tab" data-bs-toggle="tab"
					href="#GENERAL" role="tab" aria-controls="profile"
					aria-selected="false">GENERAL NEWS</a></li>

			</ul>
			<div class="tab-content " id="myTabContent">
				<div class="tab-pane fade text-white mt-3 show active"
					id="TECHNOLOGY" role="tabpanel" aria-labelledby="home-tab">

					<!-- Technology NEWS TAB -->



					<!-- Cards -->
					<div class="card-group">
						<c:forEach items="${technologyNews}" var="technologyNews">
							<div class="col-sm-12 m-4 p-2">
								<div class="card">
									<div class="card-header bg-white">

										<h5 class="card-title text-center text-dark">${technologyNews.title}</h5>
										<p class="text-muted fw-bold text-small">
											${technologyNews.publishedAtDate} <span
												class="badge bg-dark float-end">${technologyNews.name}</span>
											<br> ${technologyNews.publishedAtTime}
										</p>


									</div>
									<div class="card-body">
										<pre>
											<span class="badge bg-light text-dark">Author - ${technologyNews.author}</span>
										</pre>
										<img alt="image" class="img-fluid rounded float-end"
											src="${technologyNews.urlToImage}">
										<p class="card-text text-center text-dark">
											${technologyNews.description}</p>

									</div>
									<div class="card-footer text-center text-dark">

										<a target="_blank" href="${technologyNews.url}/"
											class="btn btn-primary btn-sm btn-center d-block"> <strong
											class=""> Read More </strong>
										</a>

									</div>
								</div>
							</div>

						</c:forEach>


					</div>
					<!-- Cards End -->

				</div>



				<div class="tab-pane fade text-white mt-3" id="BUSINESS"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- BUSINESS NEWS TAB -->


					<div class="row">

						<!-- Cards -->
						<div class="card-group">
							<c:forEach items="${businessNews}" var="businessNews">
								<div class="col-sm-12 m-4 p-2">
									<div class="card">
										<div class="card-header bg-white">

											<h5 class="card-title text-center text-dark">${businessNews.title}</h5>
											<p class="text-muted fw-bold text-small">
												${businessNews.publishedAtDate} <span
													class="badge bg-dark float-end">${businessNews.name}</span>
												<br> ${businessNews.publishedAtTime}
											</p>


										</div>
										<div class="card-body">
											<pre>
												<span class="badge bg-light text-dark">Author - ${businessNews.author}</span>
											</pre>
											<img alt="image" class="img-fluid rounded float-end"
												src="${businessNews.urlToImage}">
											<p class="card-text text-center text-dark">
												${businessNews.description}</p>

										</div>
										<div class="card-footer text-center text-dark">

											<a target="_blank" href="${businessNews.url}/"
												class="btn btn-primary btn-sm btn-center d-block"> <strong
												class=""> Read More </strong>
											</a>

										</div>
									</div>
								</div>
							</c:forEach>


						</div>
						<!-- Cards End -->

					</div>

				</div>

				<div class="tab-pane fade text-white mt-3 " id="SPORTS"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- "SPORTS" NEWS TAB -->

					<div class="container">

						<div class="row">

							<!-- Cards -->
							<div class="card-group">
								<c:forEach items="${sportsNews}" var="sportsNews">
									<div class="col-sm-12 m-4 p-2">
										<div class="card">
											<div class="card-header bg-white">

												<h5 class="card-title text-center text-dark">${sportsNews.title}</h5>
												<p class="text-muted fw-bold text-small">
													${sportsNews.publishedAtDate} <span
														class="badge bg-dark float-end">${sportsNews.name}</span>
													<br> ${sportsNews.publishedAtTime}
												</p>


											</div>
											<div class="card-body">
												<pre>
													<span class="badge bg-light text-dark">Author - ${sportsNews.author}</span>
												</pre>
												<img alt="image" class="img-fluid rounded float-end"
													src="${sportsNews.urlToImage}">
												<p class="card-text text-center text-dark">
													${sportsNews.description}</p>

											</div>
											<div class="card-footer text-center text-dark">

												<a target="_blank" href="${sportsNews.url}/"
													class="btn btn-primary btn-sm btn-center d-block"> <strong
													class=""> Read More </strong>
												</a>

											</div>
										</div>
									</div>
								</c:forEach>


							</div>
							<!-- Cards End -->

						</div>

					</div>
				</div>
				<div class="tab-pane fade text-white mt-3 " id="SCIENCE"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- SCIENCE NEWS TAB -->

					<div class="container">

						<div class="row">

							<!-- Cards -->
							<div class="card-group">
								<c:forEach items="${scienceNews}" var="scienceNews">
									<div class="col-sm-12 m-4 p-2">
										<div class="card">
											<div class="card-header bg-white">

												<h5 class="card-title text-center text-dark">${scienceNews.title}</h5>
												<p class="text-muted fw-bold text-small">
													${scienceNews.publishedAtDate} <span
														class="badge bg-dark float-end">${scienceNews.name}</span>
													<br> ${scienceNews.publishedAtTime}
												</p>


											</div>
											<div class="card-body">
												<pre>
													<span class="badge bg-light text-dark">Author - ${scienceNews.author}</span>
												</pre>
												<img alt="image" class="img-fluid rounded float-end"
													src="${scienceNews.urlToImage}">
												<p class="card-text text-center text-dark">
													${scienceNews.description}</p>

											</div>
											<div class="card-footer text-center text-dark">

												<a target="_blank" href="${scienceNews.url}/"
													class="btn btn-primary btn-sm btn-center d-block"> <strong
													class=""> Read More </strong>
												</a>

											</div>
										</div>
									</div>
								</c:forEach>


							</div>
							<!-- Cards End -->

						</div>

					</div>
				</div>

				<div class="tab-pane fade text-white mt-3 " id="HEALTH"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- Technology NEWS TAB -->

					<div class="container">

						<div class="row">

							<!-- Cards -->
							<div class="card-group">
								<c:forEach items="${healthNews}" var="healthNews">
									<div class="col-sm-12 m-4 p-2">
										<div class="card">
											<div class="card-header bg-white">

												<h5 class="card-title text-center text-dark">${healthNews.title}</h5>
												<p class="text-muted fw-bold text-small">
													${healthNews.publishedAtDate} <span
														class="badge bg-dark float-end">${healthNews.name}</span>
													<br> ${healthNews.publishedAtTime}
												</p>


											</div>
											<div class="card-body">
												<pre>
													<span class="badge bg-light text-dark">Author - ${healthNews.author}</span>
												</pre>
												<img alt="image" class="img-fluid rounded float-end"
													src="${healthNews.urlToImage}">
												<p class="card-text text-center text-dark">
													${healthNews.description}</p>

											</div>
											<div class="card-footer text-center text-dark">

												<a target="_blank" href="${healthNews.url}/"
													class="btn btn-primary btn-sm btn-center d-block"> <strong
													class=""> Read More </strong>
												</a>

											</div>
										</div>
									</div>
								</c:forEach>


							</div>
							<!-- Cards End -->

						</div>

					</div>
				</div>

				<div class="tab-pane fade text-white mt-3 " id="GENERAL"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- "GENERAL" NEWS TAB -->



					<!-- Cards -->
					<div class="card-group">
						<c:forEach items="${generalNews}" var="generalNews">
							<div class="col-sm-12 m-4 p-2">
								<div class="card">
									<div class="card-header bg-white">

										<h5 class="card-title text-center text-dark">${generalNews.title}</h5>
										<p class="text-muted fw-bold text-small">
											${generalNews.publishedAtDate} <span
												class="badge bg-dark float-end">${generalNews.name}</span> <br>
											${generalNews.publishedAtTime}
										</p>


									</div>
									<div class="card-body">
										<pre>
											<span class="badge bg-light text-dark">Author - ${generalNews.author}</span>
										</pre>
										<img alt="image" class="img-fluid rounded float-end"
											src="${generalNews.urlToImage}">
										<p class="card-text text-center text-dark">
											${generalNews.description}</p>

									</div>
									<div class="card-footer text-center text-dark">

										<a target="_blank" href="${generalNews.url}/"
											class="btn btn-primary btn-sm btn-center d-block"> <strong
											class=""> Read More </strong>
										</a>

									</div>
								</div>
							</div>
						</c:forEach>


					</div>
					<!-- Cards End -->

				</div>




				<div class="tab-pane fade text-white mt-3 " id="ENTERTAINMENT"
					role="tabpanel" aria-labelledby="home-tab">

					<!-- Technology NEWS TAB -->



					<!-- Cards -->
					<div class="card-group">
						<c:forEach items="${entertainmentNews}" var="entertainmentNews">
                <<div class="col-sm-12 m-4 p-2">
								<div class="card">
									<div class="card-header bg-white">

										<h5 class="card-title text-center text-dark">${entertainmentNews.title}</h5>
										<p class="text-muted fw-bold text-small">
											${entertainmentNews.publishedAtDate} <span
												class="badge bg-dark float-end">${entertainmentNews.name}</span>
											<br> ${entertainmentNews.publishedAtTime}
										</p>


									</div>
									<div class="card-body">
										<pre>
											<span class="badge bg-light text-dark">Author - ${entertainmentNews.author}</span>
										</pre>
										<img alt="image" class="img-fluid rounded float-end"
											src="${entertainmentNews.urlToImage}">
										<p class="card-text text-center text-dark">
											${entertainmentNews.description}</p>

									</div>
									<div class="card-footer text-center text-dark">

										<a target="_blank" href="${entertainmentNews.url}/"
											class="btn btn-primary btn-sm btn-center d-block"> <strong
											class=""> Read More </strong>
										</a>

									</div>
								</div>
							</div>
						</c:forEach>


					</div>
					<!-- Cards End -->

				</div>


			</div>





		</article>


	</section>


	<section class="bg-dark p-5 m-3 rounded-2">


		<header>
			<h4 id="search" class="text-muted text-center">
				<strong> Search Result </strong>
			</h4>
		</header>

		<article>


			<div class="row">
				<!-- Cards -->
				<div class="container">
					<div class="card-group">
						<c:forEach items="${searchNews}" var="searchNews">
							<div class="col-sm-12 m-4 p-2">
								<div class="card">
									<div class="card-header bg-white">

										<h5 class="card-title text-center text-dark">${searchNews.title}</h5>
										<p class="text-muted fw-bold text-small">
											${searchNews.publishedAtDate} <span
												class="badge bg-dark float-end">${searchNews.name}</span> <br>
											${searchNews.publishedAtTime}
										</p>


									</div>
									<div class="card-body">
										<pre>
											<span class="badge bg-light text-dark">Author - ${searchNews.author}</span>
										</pre>
										<img alt="image" class="img-fluid rounded float-end"
											src="${searchNews.urlToImage}">
										<p class="card-text text-center text-dark">
											${searchNews.description}</p>

									</div>
									<div class="card-footer text-center text-dark">

										<a target="_blank" href="${searchNews.url}/"
											class="btn btn-primary btn-sm btn-center d-block"> <strong
											class=""> Read More </strong>
										</a>

									</div>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
			</div>


		</article>


	</section>


	<footer></footer>








	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous" type="text/javascript"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		crossorigin="anonymous" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		crossorigin="anonymous" type="text/javascript"></script>

</body>

</html>