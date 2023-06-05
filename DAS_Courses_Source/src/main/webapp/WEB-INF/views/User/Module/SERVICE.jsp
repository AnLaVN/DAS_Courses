<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>



	<div class="my-4 m-0 mx-md-5 row justify-content-end">
		<div class="col-12 col-lg-7 m-0 p-0">

			<div class="card mb-5">
				<div class="card-body">
					<spring:message code="user.service.title"/>
				</div>
			</div>

			<div class="accordion" id="SERVICE">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence1">
							<spring:message code="user.service.title_1"/>
						</button>
					</h2>
					<div id="Sentence1" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_1"/>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence2">
							<spring:message code="user.service.title_2"/>
						</button>
					</h2>
					<div id="Sentence2" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_2"/>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence3">
							<spring:message code="user.service.title_3"/>
						</button>
					</h2>
					<div id="Sentence3" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_3"/>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence4">
							<spring:message code="user.service.title_4"/>
						</button>
					</h2>
					<div id="Sentence4" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_4"/>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence5">
							<spring:message code="user.service.title_5"/>
						</button>
					</h2>
					<div id="Sentence5" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_5"/>
							<br>
							<ul>
								<li>
									<spring:message code="user.service.content_5.1"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.2"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.3"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.4"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.5"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.6"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.7"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.8"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.9"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.10"/>
								</li>
								<li>
									<spring:message code="user.service.content_5.11"/>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence6">
							<spring:message code="user.service.title_6"/>
						</button>
					</h2>
					<div id="Sentence6" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_6"/>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed collapsed bg-opacity-75 fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#Sentence7">
							<spring:message code="user.service.title_7"/>
						</button>
					</h2>
					<div id="Sentence7" class="accordion-collapse collapse" data-bs-parent="#SERVICE">
						<div class="accordion-body">
							<spring:message code="user.service.content_7"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>