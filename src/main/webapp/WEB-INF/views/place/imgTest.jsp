<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>이미지사이즈 체크</TITLE>
</HEAD>
<script>
function getFileExtension(filePath){  // 파일의 확장자를 가져옮
    var lastIndex = -1;
    lastIndex  = filePath.lastIndexOf('.');
    var extension = "";

 if(lastIndex != -1){
  extension = filePath.substring( lastIndex+1, filePath.len );
 }else{
  extension = "";
 }
    return extension;
}

function fnImg_Check(value){   // 파일 확장자 체크하기.
    var src = getFileExtension(value);
 
 if(!((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg"))){
        alert('gif 와 jpg 파일만 지원합니다.');
        return;
    }
    LoadImg( value);
}

function LoadImg(value){
    var imgInfo = new Image();
    imgInfo.onload = img_Load;
    imgInfo.src = value;
}

function img_Load(){
    var imgWidth, imgHeight, imgFileSize;
    var maxFileSize = 5000;  // 이미지사이즈 제한(5MB)

    imgWidth  = this.width;
    imgHeight  = this.height;
    imgFileSize  = Math.round(this.fileSize/1024);

 if (imgFileSize > maxFileSize){
        alert("등록하실 첨부파일 이미지가 용량을 초과하였습니다.");
        return;
    }

    //이미지 사이즈 저장 
    document.all.imgWidth.value  = imgWidth;
    document.all.imgHeight.value = imgHeight;

 var imgName = document.board.fileName.value;
 var imgType = getFileExtension(imgName);

 document.getElementById("IMG_SIZE_W").innerText  = imgWidth;
 document.getElementById("IMG_SIZE_H").innerText  = imgHeight;
 document.getElementById("IMG_SIZE").innerText  = imgFileSize; 
 document.board.myImg.src = imgName
 document.board.myImg.style.visibility = 'visible';

 var ary = imgName.split('\\');
 document.getElementById("IMG_NAME").innerText  = ary[ary.length-1].split('.')[0]+"."+imgType;

}
</script>
<BODY>
<form name='board'> 
이미지 파일 미리보기 : <IMG id="myImg" alt='미리보기 이미지..~!!' Style='VISIBILITY: hidden'> <br><br>
이미지 파일 체크하기 (jpg or gif 파일)<br><br><br>
파일 등록하기 : <input type="file" name="fileName" onChange="fnImg_Check(this.value)"><br><br><br>
이미지 사이즈 가져오기 : <span id="IMG_SIZE_W">000</span> X <span id="IMG_SIZE_H">000</span>&nbsp;픽셀<br>
이미지 파일 용량 가져오기 : <span id="IMG_SIZE"></span>&nbsp;Byte<br>
이미지 파일명 가져오기 : <span id="IMG_NAME"></span>&nbsp;
<input type="hidden" name="imgWidth">
<input type="hidden" name="imgHeight"> 
</form> 
</BODY>
</HTML>



