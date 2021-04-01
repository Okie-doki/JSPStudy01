<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron mb-5">
	<div class="container">
		<h1 class="display-5">상품등록</h1>
	</div>
</div>

<div class="container">

	<form action="pinsert" class="form-horizontal" method="post"
		enctype="multipart/form-data">

		<div class="form-group row">
			<label class="col-sm-2">name</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">unitPrice</label>
			<div class="col-sm-3">
				<input type="text" id="unitPrice" name="unitPrice"
					class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">description</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">manufacturer</label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">category</label>
			<div class="col-sm-3">
				<input type="text" name="category" id="category" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">unitsInStock</label>
			<div class="col-sm-3">
				<input type="text" id="unitsInStock" name="unitsInStock"
					class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">condition</label>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="radio"
					class="form-check-input" name="condition" value="New" checked>New
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="radio"
					class="form-check-input" name="condition" value="Old">Old
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="radio"
					class="form-check-input" name="condition" value="Refurbished">Refurbished
				</label>
			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">file</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control"
					id="productImage">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10 ">
				<input type="submit" class="btn btn-primary" value="상품추가">
			</div>
		</div>
	</form>
	
</div>

<%@ include file="../include/footer.jsp"%>