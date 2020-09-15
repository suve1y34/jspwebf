<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="sectionContainerCenter">
	<div>
		<c:if test="${loginUser.i_user == data.i_user}">
			<div>
				<a href="/restaurant/restMod?i_rest=${data.i_rest}"><button>수정</button></a>
				<button onclick="isDel()">삭제</button>
				
				<form id="recFrm" action="/restaurant/addRecMenusProc" enctype="nultipart/form-data" method="post">
					<div><button type="button" onclick="addRecMenu()">메뉴 추가</button></div>
					<input type="hidden" name="i_rest" value="${data.i_rest }">
					<div id="recItem"></div>
				</form>
			</div>
		</c:if>
		<div>
			가게 사진들
		</div>
		<div class="restaurant-detail">
			<div id="detail-header">
				<div class="restaurant_title_wrap"></div>
					<span class="title">
						<h1 class="restaurant_name">${data.nm }</h1>
					</span>
					
				<div class="status_branch_none">
					<span class="cnt_hit">${data.cntHits }</span>
					<span class="cnt favorite">${data.cntFavorite }</span>
				</div>
			</div>
			<div>
				<table>
					<caption>식당 상세 정보</caption>
					<tbody>
						<tr>
							<th>주소</th>
							<td>${data.addr}</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>${data.cd_category_nm }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<script>
		var idx = 0;
		
		function addRecMenu() {
			var div = document.createElement('div')
			
			var inputNm = document.createElement('input')
			inputNm.setAttribute('type', "text");
			inputNm.setAttribute('name', 'menu_nm');
			var inputPrice = document.createElement('input')
			inputPrice.setAttribute("type", "number");
			inputNm.setAttribute('name', 'menu_price');
			var inputPic = document.createElement('input')
			inputPic.setAttribute("type", "file");
			inputNm.setAttribute('name', 'menu_pic' + idx++);
			
			div.append('메뉴: ')
			div.append(inputNm)
			div.append('가격: ')
			div.append(inputPrice)
			div.append('사진: ')
			div.append(inputPic)
			
			recItem.append(div)
		}
		addRecMenu()
	
		function isDel() {
			if(confirm('삭제 하시겠습니까?')) {
				location.hreft = '/restaurant/restDel?i_rest=${data.i_rest}'
			}
		}
	</script>
</div>