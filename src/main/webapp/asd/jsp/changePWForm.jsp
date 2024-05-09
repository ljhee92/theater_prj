<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="예외 처리"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<style type="text/css">
    #pwWrap {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.5); /* 투명한 배경 */
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999; /* 다른 요소 위에 표시 */
    }
    
    #background {
        width: 600px;
        height: 450px;
        background-color: white;
        padding: 10px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    #inputWrap {
        margin-bottom: 20px;
    }
    
    .inputTxt {
        width: 250px;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    #btnWrap {
        text-align: center;
    }
    
    .btn {
        padding: 10px 20px;
        margin: 0 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .btn-success {
        background-color: #28a745;
        color: white;
    }
    
    .btn-secondary {
        background-color: #6c757d;
        color: white;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    window.onload = function() {
        document.getElementById("btn").addEventListener("click", pwNullChk); // 버튼 클릭
        document.getElementById("cancel").addEventListener("click", function() {
            window.close(); // 현재 창을 닫음
        }); // 버튼 클릭
        
        document.getElementById("pw").addEventListener("keydown", isEnter); // 엔터키 입력
        document.getElementById("pw2").addEventListener("keydown", isEnter); // 엔터키 입력
    } 

    function isEnter(evt) {
        if (evt.which == 13) {

           pwNullChk(); // 다른 필드에서는 기존과 같이 비밀번호 유효성 검사 실행
           
        }
    }

    function pwNullChk() {
        var obj = document.subFrm;
        var pw = obj.pw.value;
        var pw2 = obj.pw2.value;

        if (pw.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            obj.pw.value = "";
            obj.pw.focus();
            return;
        }

        if (pw2.trim() === "") {
            alert("비밀번호 확인을 입력해주세요.");
            obj.pw2.value = "";
            obj.pw2.focus();
            return;
        }
        
        if (pw.trim() !== pw2.trim()) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }
        

        
        
        
        
        
        
        alert("다음 과정 진행 가능합니다.")
        $("#subFrm").submit();
    }
</script>
</head>
<body>

<div id="pwWrap">
    <div id="background">
        <div id="inputWrap">
            <form method = "post"  action="changePWAction.jsp" id="subFrm"  name="subFrm">
            	<input type="hidden" name = "id" id="id" value="${id}">
                <input type="password" name="pw" id="pw" class="inputTxt inputIdtype" placeholder="비밀번호 입력" />
                <br/>
                <input type="password" name="pw2" id="pw2" class="inputTxt inputIdtype" placeholder="비밀번호 확인" />
                <input type="text" style="display: none" />
                <br/>
                <div id="btnWrap">
                    <input type="button" value="비밀번호 변경" id="btn" class="btn btn-success btn-sm" />
                    <input type="button" value="취소" id="cancel" class="btn btn-secondary btn-sm" />
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>