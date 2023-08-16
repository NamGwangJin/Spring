<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/cafeStyle.css">
    <title>Cafe</title>
</head>
<body style="background-color:ivory;">
<c:if test="${id == ''}">
<a href='login' style='text-align:right'><h3>로그인</h3></a>
<a href='signup' style='text-align:right'><h3>회원가입</h3></a>
</c:if>
<c:choose>
<c:when test="${id == 'rhkdwls'}">
	<h4 style='text-align:right'>관리자님</h4><a href="/logout" style='text-align:right'><h3>로그아웃</h3></a>
</c:when>
<c:when test="${id != ''}">
<h4 style='text-align:right'>${id}님</h4><a href="/logout" style='text-align:right'><h3>로그아웃</h3></a>
</c:when>
</c:choose>
<c:if test="${id == 'rhkdwls'}">
<input type=hidden id=number>
<h5>관리자 메뉴</h5>
    <input type=button id=btnAddMenu name=btnAddMenu value="메뉴추가" style='background-color:green; color:white'>
    <input type=button id=btnDelete name=btnDelete value="메뉴삭제" style='background-color:red; color:white'>
    <input type=button id=btnUpdate name=btnUpdate value="메뉴수정"style='background-color:black; color:white'>
</c:if>
<h1 style="font-weight:bold; text-align:center; font-family:cursive">
&#9749;HIMEDIA CAFE&#9749;
</h1>
<c:choose>
<c:when test="${id == 'rhkdwls'}">
<table class="table" style="margin-left: auto; margin-right: auto; text-align:center;">
    <tr>
        <td>
         <table>
            <caption><h2>&#127856;주문하기&#127856;</h2></caption>
        <tr>
            <td colspan="2"><select id="menu" size="30" style="width:500px; height:400px; text-align:center;">
            </select></td>
        </tr>
        <tr><td class="fs20">메뉴명</td><td><input id="selMenu" type="text" style="width:250px; height:40px; text-align:center;" class="inputstyle"></td></tr>
        <tr><td class="fs20">수량</td><td><input id="qty" type="number" min="1" style="width:50px; height:30px; text-align:right;" class="inputstyle">개</td></tr>
        <tr><td class="fs20">금액</td><td><input readonly id="selPrice" type="number" style="width:100px; height:30px; text-align:right;" class="inputstyle">원</td></tr>
        <tr><td colspan="3" style="text-align:center"><input id="cart" class="btn" type="button" value="메뉴담기">&nbsp;
            <input class="btncc" type="button" value="선택 취소" id="cancle"></td></tr>
        </table>
        </td>

        <td>
            <table>
                <caption><h2>&#128722;장바구니&#128722;</h2></caption>
                <tr><td colspan="2"><select id="order" size="20" style="width:500px; height:500px;">
                </select></td></tr>
                <tr><td>결제 금액 &nbsp;<input id="sumPrice" type="number" style="width:100px; text-align:right;" class="inputstyle" readonly>원</td></tr>
                <tr><td>적립 번호 &nbsp;<input id="mobile" type="text" style="width:150px; text-align:center;" placeholder="010-0000-0000" class="inputstyle">
                <input id="search" style="background-color:ivory; font-weight:bold;" type="button" value="조회"></td></tr>
                <tr><td colspan="3" style="text-align:center"><input id="orderOk" class="btn" type="button" value="주문 완료">&nbsp;
                    <input class="btncc" type="button" value="주문 삭제" id="delete"></td></tr>
            </table>
        </td>
        
        <td>
        <table>
            <caption><h2>&#127900;매출 내역&#127901;</h2></caption>
            <tr><td colspan="2"><select id="sales" size="100" style="width:600px; height:700px;">
            </select></td></tr>
            <tr><td>총 매출<input readonly id="sumSales" type="number" class="inputstyle" style="text-align:right;">원</td></tr>
        </table>
        </td>
    </tr>
</table>
</c:when>
<c:otherwise>
<table class="table" style="margin-left: auto; margin-right: auto; text-align:center;">
    <tr>
        <td>
         <table>
            <caption><h2>&#127856;주문하기&#127856;</h2></caption>
        <tr>
            <td colspan="2"><select id="menu" size="30" style="width:500px; height:400px; text-align:center;">
            </select></td>
        </tr>
        <tr><td class="fs20">메뉴명</td><td><input id="selMenu" type="text" style="width:250px; height:40px; text-align:center;" class="inputstyle"></td></tr>
        <tr><td class="fs20">수량</td><td><input id="qty" type="number" min="1" style="width:50px; height:30px; text-align:right;" class="inputstyle">개</td></tr>
        <tr><td class="fs20">금액</td><td><input readonly id="selPrice" type="number" style="width:100px; height:30px; text-align:right;" class="inputstyle">원</td></tr>
        <tr><td colspan="3" style="text-align:center"><input id="cart" class="btn" type="button" value="메뉴담기">&nbsp;
            <input class="btncc" type="button" value="선택 취소" id="cancle"></td></tr>
        </table>
        </td>

        <td>
            <table>
                <caption><h2>&#128722;장바구니&#128722;</h2></caption>
                <tr><td colspan="2"><select id="order" size="20" style="width:500px; height:500px;">
                </select></td></tr>
                <tr><td>결제 금액 &nbsp;<input id="sumPrice" type="number" style="width:100px; text-align:right;" class="inputstyle" readonly>원</td></tr>
                <tr><td>적립 번호 &nbsp;<input id="mobile" type="text" style="width:150px; text-align:center;" placeholder="010-0000-0000" class="inputstyle">
                <input id="search" style="background-color:ivory; font-weight:bold;" type="button" value="조회"></td></tr>
                <tr><td colspan="3" style="text-align:center"><input id="orderOk" class="btn" type="button" value="주문 완료">&nbsp;
                    <input class="btncc" type="button" value="주문 삭제" id="delete"></td></tr>
            </table>
        </td>
</c:otherwise>
</c:choose>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${path}/resources/js/cafeScript.js"></script>
</html>