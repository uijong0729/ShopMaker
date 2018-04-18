<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/Bpage/orderFormCss.css?ver=2">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="wraper">
      <br> <br> <br> <br>
      <form>
         <div class="orderDiv">
            <div class="orderer_info">
               <p class="title">주문자 정보</p>
               <table class="orderer InfoTable">
                  <tr>
                     <td>주문자 이름 <b style="color: red">*</b></td>
                     <td><input style="height: 100%;"></td>
                  </tr>
                  <tr>
                     <td>이메일 <b style="color: red">*</b></td>
                     <td>
                        <input type="text" id="str_email01" style="width: 100px"> 
                        @ 
                        <input type="text" id="str_email02" style="width: 100px;"> 
                        <select style="width: 100px; margin-right: 10px" name="selectEmail" id="selectEmail">
                           <option value="1" selected>직접입력</option>
                           <option value="naver.com">naver.com</option>
                           <option value="hanmail.net">hanmail.net</option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>연락처 <b style="color: red">*</b></td>
                     <td><input type="text" id="orderer_name"></td>
                  </tr>
               </table>
            </div>
            <br>
            <div class="delivery_Info">
               <p class="title">배송정보</p>
               <table class="delivery InfoTable">
                  <tr>
                     <td>수령자 주소 <b style="color: red">*</b></td>
                     <td>
                        <input type="text" style="width: 300px" class="addressInput" id="baseAddress"> 기본 주소 <br> 
                        <input type="text" style="width: 300px" class="addressInput"> 상세 주소 <br>
                     </td>
                  </tr>
                  <tr>
                     <td>수령자 성함 <b style="color: red">*</b></td>
                     <td><input type="text" id="orderer_name"></td>
                  </tr>
                  <tr>
                     <td>수령자 휴대폰 <b style="color: red">*</b></td>                     
                     <td><input type="text" id="orderer_name"></td>
                  </tr>
                  <tr>
                     <td>배송시 요청사항</td>
                     <td><textarea style="width: 100%; height: 100px;" placeholder="이곳은 배송기사님이 보시는란입니다. 주문관련 문의는 게시판을 이용해주세요"></textarea>
                     </td>
                  </tr>
               </table>
            </div>

            <br>
            <div class="product_info">
               <p class="title">주문 품목 확인</p>
               <table class="product_table">
                  <tr>
                     <td colspan="2">주문상품</td>
                     <td>수량</td>
                     <td>상품 금액</td>
                     <td>적립금</td>
                  </tr>
                  
                  <c:forEach items="" var="basket">
                     <tr>
                        <td><img src="#" width="100%"></td>
                        <td>
                           <div class="product_name" style="width: 60%; float: left;"></div>
                        </td>
                        <td class="product_amount"></td>
                        <td class="product_price"></td>
                        <fmt:parseNumber var="Amount_accumulated" integerOnly="true"/>
                        <td></td>
                     </tr>
                  </c:forEach>   
                  
                  
                  
                  <tr>
                     <td colspan="7" style="text-align: center; font-size: 20px; border-bottom: none;"> 배송비 :  원 </td>
                  </tr>
                  
                  <tr>
                     <td colspan="7" class="payment_amount" style="text-align: center; font-size: 20px;">총 결제 금액 : 원 </td>
                  </tr>
               </table>
            </div>

               <div class="last_Payment">
                  <button type="submit" class="img_btn" onclick="pre_order_check()">카카오페이 주문결제 </button>
               </div>
      </form>
      </div>
      
      <script type="text/javascript">
         function pre_order_check() {
            if($("#orderer_name").val() == '' || $("#str_email01").val() == '' || $("#str_email02").val() == '' 
               || $("#cellphone1").val() == ''|| $("#cellphone2").val() == ''|| $("#cellphone3").val() == ''
                  || $("#postCode").val() == ''|| $("#baseAddress").val() == ''|| $("#addressInput").val() == ''|| $("#orderer_name").val() == ''
                     || $("#cellphone1").val() == ''|| $("#cellphone2").val() == ''|| $("#cellphone3").val() == ''){
               alert('필수 사항들을 꼭 입력해주세요.');
               event.preventDefault();
            }
         }
      </script>   
      

   <!-- 이메일 입력방식 : 직접입력 -->
   <script type="text/javascript">
      //이메일 입력방식 선택 
      $('#selectEmail').change(function() {
         $("#selectEmail option:selected").each(function() {
            if ($(this).val() == '1') { //직접입력일 경우 
               $("#str_email02").val(''); //값 초기화 
               $("#str_email02").attr("readonly", false); //활성화 
            } else { //직접입력이 아닐경우
               $("#str_email02").val($(this).text()); //선택값 입력 
               $("#str_email02").attr("readonly", true); //비활성화 
            }
         });
      });
   </script>      
   
</body>
</html>