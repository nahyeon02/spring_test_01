<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%-- <%@ include file="/WEB-INF/views/header.jsp" %> --%>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<html>

				<head>
					<title>Home</title>
					<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
					<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
					<script
						src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
					<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
					<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
					<style>
						@charset "UTF-8";

						a {
							color: #000;
							text-decoration: none;
						}

						* {
							box-sizing: border-box;
						}

						li {
							list-style: none;
						}

						.storyrepeat {
							margin: auto;
							width: 600px;
						}

						/* 스토리 글쓰기 */
						.story_wrapper {
							min-width: 1280px;
							margin-top: 95px;
							margin-left: auto;
							margin-right: auto;
							margin-bottom: 20px;
						}

						.story_write {
							margin: auto;
							width: 600px;
							border: 1px solid #e5e6e9;
							border-radius: 4px;
							background: white;
							margin-bottom: 20px;
						}

						.write_content {
							width: 100%;
						}

						/* 로그인 한 경우 */
						.write_content textarea {
							width: 100%;
							height: 110px;
							color: #8c8c8c;
							font-size: 14px;
							box-sizing: border-box;
							padding: 18px 10px;
							border: 0;
							resize: none;
							/* textarea 오른쪽 구석 밑쪽에 '//' 표시 지워줌  */
						}

						/* 로그인 한 경우 */

						/* 로그인 하지 않은 경우 */
						.write_content div {
							width: 100%;
							height: 110px;
							color: #8c8c8c;
							font-size: 14px;
							box-sizing: border-box;
							padding: 18px 10px;
							border: 0;
							cursor: pointer;
						}

						/* 로그인 하지 않은 경우 */

						.story_hr {
							padding: 10px;
							box-sizing: border-box;
						}

						.hr_line {
							width: 100%;
							height: 1px;
							background: #dfdfdf;
						}

						.story_menu {
							height: 36px;
							padding: 0 10px;
							;
						}

						.story_menu_left {
							display: inline-block;
							box-sizing: border-box;
							color: #fff;
							font-weight: 900;
							font-size: 14px;
							background: #c8c8c8;
							border: 1px #8c8c8c;
							border-radius: 4px;
							height: 28px;
							line-height: 27px;
							padding: 0 20px;
							cursor: pointer;
							position: relative;
							overflow: hidden;
						}

						.photo_btn {
							position: absolute;
							top: 0;
							right: 0;
							margin: 0;
							padding: 0;
							font-size: 20px;
							cursor: pointer;
							opacity: 0;
						}

						.story_menu_right {
							float: right;
						}

						.create_btn {
							box-sizing: border-box;
							color: #fff;
							font-weight: 900;
							font-size: 14px;
							background: #917751;
							border: 0;
							border-radius: 4px;
							width: 100%;
							height: 28px;
							padding: 0 20px;
							cursor: pointer;
						}

						/* 스토리 글쓰기 */

						.story_item {
							border: 1px solid #e5e6e9;
							border-radius: 3px;
							margin-bottom: 20px;
							background: white;
						}

						.story_write {
							padding: 10px;
							box-sizing: border-box;
						}

						.writer_profile {
							display: inline-block;
							vertical-align: top;
							margin-top: 10px;
							margin-left: 10px;
						}

						.writer_profile img {
							object-fit: cover;
							border-radius: 50%;
							width: 50px;
							height: 50px;
						}

						.writer_info {
							display: inline-block;
							vertical-align: top;
							padding-left: 6px;
							margin-top: 10px;
						}

						.writer_name {
							padding-top: 4px;
							display: block;
							font-size: 14px;
							font-weight: 900;
						}

						.writer_datetime {
							display: block;
							font-size: 11px;
							padding-top: 4px;
							color: #8c8c8c;
						}

						.writer_option {
							display: flex;
							justify-content: flex-end;
							float: right;
							margin-right: 10px;
							margin-top: 10px;
						}

						.writer_option div {
							margin-left: 10px;
						}

						.writer_report_btn {
							display: inline-block;
							color: #969696;
							cursor: pointer;
							width: 30px;
							height: 30px;
							text-align: center;
							line-height: 30px;
							opacity: .6;
							position: relative;
						}

						.content_description {
							white-space: normal;
							font-size: 14px;
							line-height: 22px;
							box-sizing: border-box;
							padding: 5px 10px 20px 10px;
						}

						.content_gallery {
							margin-bottom: 20px;
							position: relative;
						}

						.slick_list {
							position: relative;
							display: block;
							overflow: hidden;
						}

						.slick-track {
							opacity: 1;
							width: 1683px;
							transform: translate3d(0px, 0px, 0px);
							position: relative;
							top: 0;
							left: 0;
							display: block;
						}

						.story_like {
							padding: 15px;
						}

						.story_like img {
							cursor: pointer;
							width: 20px;
							height: 20px;
							display: inline-block;
							vertical-align: middle;
						}

						.like_cnt {
							font-size: 13px;
						}

						.story_reply {
							border-top: 1px solid #f2f2f2;
							background: #fafafa;
							padding: 10px;
							box-sizing: border-box;
							font-size: 12px;
							border-bottom-left-radius: 4px;
							border-bottom-right-radius: 4px;
						}

						.reply_write table {
							width: 100%;
							border-spacing: 0;
							border-collapse: collapse;
						}

						.reply_input {
							color: #969696;
							border: 1px solid #e5e5e5;
							background: #fdfdfd;
							font-size: 14px;
							box-sizing: border-box;
							padding: 5px 10px;
							width: 100%;
						}

						.reply_write_btn {
							opacity: .6;
							box-sizing: border-box;
							color: #fff;
							font-size: 14px;
							background: #917751;
							border: 0;
							border-radius: 4px;
							width: 100%;
							height: 28px;
							line-height: 18px;
							cursor: pointer;
						}

						/*스토리 댓글*/
						.comWImg {
							object-fit: cover;
							border-radius: 50%;
							width: 20px;
							height: 20px;
						}

						/*프리뷰이미지*/
						.preview div {
							display: inline-block;
						}

						.previewImgDiv {
							width: 100px;
							height: 100px;
							overflow: hidden;
							margin-right: 5px;
						}

						.previewImgDiv img {
							object-fit: cover;
							height: 200px;
							width: 100px;
							position: relative;
							z-index: 1;
						}

						.story_thum_del {
							position: absolute;
							z-index: 9;
						}

						/*이미지 슬라이더*/
						.bx-wrapper {
							box-shadow: none;
						}

						.writer_option img {
							width: 25px;
						}

						.replyLi button {
							margin-left: 10px;
							background: #c8c8c8;
							border: 1px solid #c8c8c8;
							border-radius: 4px;
							color: white;
						}

						.comm_report {
							display: inline-block;
						}

						.st_com_content {
							border: none;
							margin-left: 10px;

						}
					</style>

					<script>
						var lastScrollTop = 0;
						var sel_files = [];
						var image_name = [];
						var index = 0;
						$(document).ready(function () {
							var slider = $('.content_gallery_item').bxSlider({
								auto: false,
								autoControls: false,
								pager: false,
								minSlides: 1,
								maxSlides: 3,
								slideWidth: 190,
								slideMargin: 10,
								moveSlides: 1,
								infiniteLoop: false, //무한루프
								hideControlOnEnd: true,
								controls: false
							});

							$("#photo_btn").on("change", handleImg);
							$("#create_btn").on("click", createInstar);
						});

						function handleImg(e) {
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);
							filesArr
								.forEach(function (f) {
									if (!f.type.match("image.*")) {
										alert("이미지 파일만 등록해주세요");
										return
									}
									sel_files.push(f.name);
									var reader = new FileReader();
									reader.onload = function (e) {
										img_html = "<div class=\"previewImgDiv\"" + " id = \"img" + index + "\">"
											+ "<button class='story_thum_del' onclick ='imgDel("
											+ index
											+ ")'>X</button>"
											+ "<img src=\"" + e.target.result + "\" />"
											+ "</div>";
										$(".preview").append(img_html);
										index++;

									}
									reader.readAsDataURL(f);
								});


						}
						function imgDel(index) {
							var img_id = "#img" + index;
							console.log($(img_id).index());
							sel_files.splice($(img_id).index(), 1);
							var del_img = $(img_id).remove();
						};
						function reply_write_btn(e) {
							console.log(this.parents('.st_num').val());

						}
						function createInstar() {
							var data = {
								content: $("#st_content").val(),
								nickname: $("input[name=nickname]").val(),
								board_pw: $("input[name=board_pw]").val(),
								images_name: sel_files
							};
							$
								.ajax({
									type: 'POST',
									url: 'boardCreate.do',
									data: data,
									success: function (data) {
										sel_files = [];
										index = 0;
										var board_no = $(".storyrepeat")
											.children(".story_item").first().attr(
												'data-st_num');

										$
											.ajax({
												type: 'POST',
												url: 'insertBpardList.do',
												data: {
													board_no: board_no
												},
												datatype: 'html',
												success: function (data) {
													data.insertBpardList
														.forEach(function (f) {
															var imgpush = [];
															board_html1 = "<div class=\"story_item\"" + "data-st_num =\"" + f.board_no + "\">"
																+ "<div class=\"story_writer\">"
																+ "<div class=\"writer_info\">"
																+ "<div class=\"writer_name\">"
																+ "<a href=\"\">"
																+ f.nickname
																+ "</a>"
																+ "</div>"
																+ "<div class=\"writer_datetime\">"
																+ f.board_date
																+ "</div>"
																+ "</div>"
																+ "<div class=\"writer_option\">"
																+ "<div class=\"storyDelBtnDiv\">"
																+ "<span class=\"storyDeleteBtn\">"
																+ "<img src='/resources/images/if_trash_bin_1370026.png'>"
																+ "</span>"
																+ "</div>"
																+ "</div>"
																+ "</div>"
																+ "<div class=\"story_content\">"
																+ "<div class=\"content_description\">"
																+ "<pre>"
																+ f.content
																+ "</pre>"
																+ "</div>"
																+ "<div class=\"content_gallery\">"
																+ "<div class=\"content_gallery_item\">";
															data.imageaddlist
																.forEach(function (e) {
																	img = e.board_no;
																	board = f.board_no;
																	if (board == img) {
																		board_html2 = "<div class='sliderDiv'>"
																			+ "<img alt=\"storyImg\""
																			+ "src=\"/resources/images/"
																			+ e.image_name
																			+ "\""
																			+ "style = \"max-width: 100%; display: block; box-sizing:border-box;\">"
																			+ "</div>";
																		imgpush.push(board_html2);
																	}

																});
															board_html3 = "</div>"
																+ "</div>"
																+ "</div>"
																+ "<div class=\"story_reply\">"
																+ "<div class=\"reply_write\">"
																+ "<table>"
																+ "<tr>"
																+ "<td>"
																+ "<input type=\"text\""
																+ "name=\"st_com_content\""
																+ "id=\"st_com_content\""
																+ "class=\"reply_input\""
																+ "placeholder=\"댓글을 입력하세요!\">"
																+ "</td>"
																+ "<td style=\"width:10px;\">"
																+ "</td>"
																+ "<td style=\"width:60px;\">"
																+ "<button style=\"opacity:1\"" + "id=\"reply_write_btn\"" + "class=\"reply_write_btn\" onclick = 'reply_write_btn();' >"
																+ "등록</button>"
																+ "</td>"
																+ "</tr>"
																+ "<tr>"
																+ "<td>"
																+ "<ul id=\"replies\"" + "class=\"replies\">"
																+ "<li class='replyLi' >"
																+ "<img class=comWImg alt='' src='/resources/images/writer_profile.png'>"
																+ "USER_NICKNAME "
																+ "<input type=text name=st_com_content class=st_com_content value='댓글내용'>"
																+ "</li>"
																+ "</ul>"
																+ "</td>"
																+ "</tr>"
																+ "</table>"
																+ "</div>"
																+ "<div class=\"story_reply_wrapper\"" + "id=\"story_reply_wrapper\">"
																+ "</div>"
																+ "</div>"
																+ "</div>";
															board_html = board_html1 + imgpush.join('')
																+ board_html3;

															$(".storyrepeat").prepend(
																board_html);

														});
													$(".preview").empty();
													$("#st_content").val('');
													$("input[name=nickname]").val('');
													$("input[name=board_pw]").val('');

												}
											});
									}
								});
						};
						var CurrentScroll = 0;
						//스크롤 start
						$(window).scroll(
							function () {
								//현재 스크롤 좌표
								var currentScrollTop = $(window).scrollTop();
								if (currentScrollTop - lastScrollTop > 0) {
									// 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면height - 윈도의창  height) 되는 순간
									// 현재 스크롤의 위치가 화면의 보이는 위치보다 크다면
									if ($(window).scrollTop() == $(document).height()
										- $(window).height()) {

										nextboardlist();
									}
								}
								lastScrollTop = currentScrollTop;
							});
						function nextboardlist() {
							var rowNum = $(".story_item").length + 1;

							$
								.ajax({
									type: 'POST',
									url: 'nextboardlist.do',
									data: {
										rowNum: rowNum
									},
									datatype: 'html',
									success: function (data) {
										data.boardaddlist
											.forEach(function (f) {
												var imgpush = [];
												board_html1 = "<div class=\"story_item\"" + "data-st_num =\"" + f.board_no + "\">"
													+ "<div class=\"story_writer\">"
													+ "<div class=\"writer_info\">"
													+ "<div class=\"writer_name\">"
													+ "<a href=\"\">"
													+ f.nickname
													+ "</a>"
													+ "</div>"
													+ "<div class=\"writer_datetime\">"
													+ f.board_date
													+ "</div>"
													+ "</div>"
													+ "<div class=\"writer_option\">"
													+ "<div class=\"storyDelBtnDiv\">"
													+ "<span class=\"storyDeleteBtn\">"
													+ "<img src='/resources/images/if_trash_bin_1370026.png'>"
													+ "</span>"
													+ "</div>"
													+ "</div>"
													+ "</div>"
													+ "<div class=\"story_content\">"
													+ "<div class=\"content_description\">"
													+ "<pre>"
													+ f.content
													+ "</pre>"
													+ "</div>"
													+ "<div class=\"content_gallery\" >"
													+ "<div class=\"content_gallery_item\">";
												data.imagelist
													.forEach(function (e) {
														img = e.board_no;
														board = f.board_no;
														if (board == img) {
															board_html2 = "<div class='sliderDiv'>"
																+ "<img alt=\"storyImg\""
																+ "src=\"/resources/images/"
																+ e.image_name
																+ "\""
																+ "style = \"max-width: 100%; display: block; box-sizing:border-box;\">"
																+ "</div>";
															imgpush.push(board_html2);
														}

													});
												board_html3 = "</div>"
													+ "</div>"
													+ "</div>"
													+ "<div class=\"story_reply\">"
													+ "<div class=\"reply_write\">"
													+ "<table>"
													+ "<tr>"
													+ "<td>"
													+ "<input type=\"text\""
													+ "name=\"st_com_content\""
													+ "id=\"st_com_content\""
													+ "class=\"reply_input\""
													+ "placeholder=\"댓글을 입력하세요!\">"
													+ "</td>"
													+ "<td style=\"width:10px;\">"
													+ "</td>"
													+ "<td style=\"width:60px;\">"
													+ "<button style=\"opacity:1\"" + "id=\"reply_write_btn\"" + "class=\"reply_write_btn\"onclick = 'reply_write_btn();' >"
													+ "등록</button>"
													+ "</td>"
													+ "</tr>"
													+ "<tr>"
													+ "<td>"
													+ "<ul id=\"replies\"" + "class=\"replies\">"
													+ "<li class='replyLi' >"
													+ "<img class=comWImg alt='' src='/resources/images/writer_profile.png'>"
													+ "USER_NICKNAME "
													+ "<input type=text name=st_com_content class=st_com_content value='댓글내용'>"
													+ "</li>"
													+ "</ul>"
													+ "</td>"
													+ "</tr>"
													+ "</table>"
													+ "</div>"
													+ "<div class=\"story_reply_wrapper\"" + "id=\"story_reply_wrapper\">"
													+ "</div>" + "</div>" + "</div>";
												board_html = board_html1 + imgpush.join('')
													+ board_html3;
												$(".storyrepeat").append(board_html);

											});

									}
								});
						};
					</script>

				</head>

				<!-- 스토리 시작 -->
				<div class="story_wrapper">

					<!-- 로그인 한 경우 스토리글쓰기  -->
					<%-- <c:if test="${email ne null }"> --%>
						<div class="story_write">
							<div class="write_content">
								<textarea wrap="hard" name="st_content" id="st_content"
									placeholder="우리집에 대한 이야기를 글과 사진으로 남겨주세요 :)"></textarea>
							</div>
							<div class="story_hr">
								<div class="hr_line"></div>
								<div class="preview" id="preview">

								</div>
							</div>
							<div class="story_menu">
								<div class="story_menu_left">
									<input type="file" id="photo_btn" class="photo_btn" name="photo_btn" multiple
										accept="image/*">사진선택
								</div>
								<div class="story_menu_right">
									<input type="button" class="create_btn" id="create_btn" value="등록">
								</div>
							</div>
						</div>
						<%-- </c:if> --%>

							<!-- 스토리 리스트  -->
							<div class="storyrepeat">
								<%-- <c:forEach items="${storylist}" var="st"> --%>
									<div class="story_item" data-st_num="${st.st_num}">
										<div class="story_writer">
											<div class="writer_profile">
												<img alt="작성자 프로필" src="/resources/images/writer_profile.png">
											</div>
											<div class="writer_info">
												<div class="writer_name">
													<a href="">USER_NICKNAME</a>
												</div>
												<div class="writer_datetime">
													2020.10.10 PM 10:10:34
												</div>
											</div>
											<div class="writer_option">
												<div class="writer_report_btn" data-balloon="신고">
													<img alt="신고버튼" src="/resources/images/flag.png">
												</div>

												<div class="storyDelBtnDiv" data-stWemail="${st.USER_EMAIL }">
													<%-- <c:if test="${email eq st.user_email || type eq '0'}"> --%>
														<span class="storyDeleteBtn"><img
																src='/resources/images/if_trash_bin_1370026.png'></span>
														<!-- 삭제버튼  -->
														<%-- </c:if> --%>
												</div>

											</div>
										</div>
										<div class="story_content">
											<div class="content_description">
												<pre>${st.st_content }</pre>
											</div>
											<div class="content_gallery">
												<div class="content_gallery_item" data-st_num="${st.st_num}">
													<!-- 스토리이미지영역 -->
													<%-- <c:forEach items="${storyImgList}" var="stImg">
														<c:if test="${st.st_num eq stImg.st_num}"> --%>
															<div class='sliderDiv'>
																<img alt="storyImg" src="/resources/images/m11.jpg">
															</div>
															<div class='sliderDiv'>
																<img alt="storyImg" src="/resources/images/m2.jpg">
															</div>
															<div class='sliderDiv'>
																<img alt="storyImg" src="/resources/images/m3.jpg">
															</div>
															<div class='sliderDiv'>
																<img alt="storyImg" src="/resources/images/m1.jpeg">
															</div>
															<%-- </c:if>
																</c:forEach> --%>
												</div>
											</div>
										</div>
										<div class="story_like">
											<input type="hidden" value="N" class="stroy_data">
											<img class="like_icon" alt="좋아요" src="/resources/images/like_icon.png">
											<span class="like_cnt">0</span>
										</div>

										<!-- 댓글 영역  -->
										<div class="story_reply">
											<div class="reply_write">
												<input type="hidden" name="st_num" class="st_num" id="st_num"
													value="${st.st_num}">
												<table>
													<tr>
														<td>
															<input type="text" name="st_com_content" id="st_com_content"
																class="reply_input" placeholder="댓글을 입력하세요!">
														</td>
														<td style="width:10px;"></td>
														<td style="width:60px;">
															<button style="opacity:1" id="reply_write_btn"
																class="reply_write_btn">등록</button>
														</td>
													</tr>
													<!-- 댓글목록 출력 -->
													<tr>
														<td>
															<ul id="replies${st.st_num}" class="replies">
																<li class='replyLi'>
																	<img class=comWImg alt=''
																		src='/resources/images/writer_profile.png'>
																	USER_NICKNAME :
																	<input type=text name=st_com_content
																		class=st_com_content value='댓글내용'>
																	<button class='st_com_report'>신고</button>
																</li>
															</ul>
														</td>
													</tr>
												</table>
											</div>
											<div class="story_reply_wrapper" id="story_reply_wrapper">
											</div>
										</div>
									</div>
									<%-- </c:forEach> --%>
							</div>
				</div>

				<!-- 댓글 업데이트 popup -->
				<div id="re_update" style=background:white>
					<div><input type="text" id="reply_num" class="reply_num"><!-- 글번호 --><input type="text"
							id="modal_num" class="modal_num"><!-- 댓글번호 --> <input type="text" id="replytext"
							class="replytext"><!-- 댓글내용 -->
					</div>
					<div>
						<button type="button" id="replyModBtn" class=replyModBtn>Modify</button>
						<button type="button" id="replyDelBtn" class=replyDelBtn>Delete</button>
						<button type="button" class="re_update_close">Close</button>
					</div>
				</div>
				<!-- 스토리 끝 -->

				<!-- <script src="/resources/script/story.js"></script> -->

				</html>