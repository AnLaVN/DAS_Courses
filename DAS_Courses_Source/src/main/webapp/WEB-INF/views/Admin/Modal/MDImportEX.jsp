<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h1 class="modal-title fs-5" id="exampleModalLabel">Import Excel Câu hỏi</h1>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form>
				<div class="mb-3">
					<label for="fileInput" class="form-label">Select a file:</label>
					<input class="form-control" type="file" id="fileInput">
				</div>

				<div class="mb-3">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="option" id="option1" value="true">
						<label class="form-check-label" for="option1">Thây thế dữ liệu cũ ?</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="option" id="option2" value="false">
						<label class="form-check-label" for="option2">Giữ lại dữ liệu cũ ?</label>
					</div>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		</div>
	</div>
</div>