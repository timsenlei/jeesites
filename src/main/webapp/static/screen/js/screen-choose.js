
    function imagesFinderOpen(){//<c:if test="${type eq 'thumb'}"><c:set var="ctype" value="images"/></c:if><c:if test="${type ne 'thumb'}"><c:set var="ctype" value="${type}"/></c:if>
        var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);
        var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/cms/article/"+year+"/"+month+
            "/&action=js&func=imagesSelectAction&thumbFunc=imagesThumbSelectAction&cb=imagesCallback&dts=0&sm=0";
        windowOpen(url,"文件管理",1000,700);
        //top.$.jBox("iframe:"+url+"&pwMf=1", {title: "文件管理", width: 1000, height: 500, buttons:{'关闭': true}});
    }
function imagesSelectAction(fileUrl, data, allFiles){
    var url="", files=ckfinderAPI.getSelectedFiles();
    for(var i=0; i<files.length; i++){//<c:if test="${type eq 'thumb'}">
        url += files[i].getThumbnailUrl();//</c:if><c:if test="${type ne 'thumb'}">
        url += files[i].getUrl();//</c:if>
        if (i<files.length-1) url+="|";
    }//<c:if test="${selectMultiple}">
    $("#images").val($("#images").val()+($("#images").val(url)==""?url:"|"+url));//</c:if><c:if test="${!selectMultiple}">
    $("#images").val(url);//</c:if>
    imagesPreview();
    //top.$.jBox.close();
}
function imagesThumbSelectAction(fileUrl, data, allFiles){
    var url="", files=ckfinderAPI.getSelectedFiles();
    for(var i=0; i<files.length; i++){
        url += files[i].getThumbnailUrl();
        if (i<files.length-1) url+="|";
    }//<c:if test="${selectMultiple}">
    $("#images").val($("#images").val()+($("#images").val(url)==""?url:"|"+url));//</c:if><c:if test="${!selectMultiple}">
    $("#images").val(url);//</c:if>
    imagesPreview();
    //top.$.jBox.close();
}
function imagesCallback(api){

    ckfinderAPI = api;
}
function imagesDel(obj){
    var url = $(obj).prev().attr("url");
    $("#images").val($("#images").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));
    imagesPreview();
}
function imagesDelAll(){
    $("#images").val("");
    imagesPreview();
}
function imagesPreview(){
    var li, urls = $("#images").val().split("|");
    $("#imagesPreview").children().remove();
    for (var i=0; i<urls.length; i++){
        if (urls[i]!=""){//<c:if test="${type eq 'thumb' || type eq 'images'}">
            li = "<li><img src=\""+urls[i]+"\" url=\""+urls[i]+"\" style=\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;\">";//</c:if><c:if test="${type ne 'thumb' && type ne 'images'}">
            li = "<li><a href=\""+urls[i]+"\" url=\""+urls[i]+"\" target=\"_blank\">"+decodeURIComponent(urls[i].substring(urls[i].lastIndexOf("/")+1))+"</a>";//</c:if>
            li += "&nbsp;&nbsp;<a href=\"javascript:\" onclick=\"imagesDel(this);\">×</a></c:if></li>";
            $("#imagesPreview").append(li);
        }
    }
    if ($("#imagesPreview").text() == ""){
        $("#imagesPreview").html("<li style='list-style:none;padding-top:5px;'>无</li>");
    }
}
imagesPreview();
