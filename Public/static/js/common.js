//dom加载完成后执行的js
$(function(){
    //全选的实现
	$(".check-all").click(function(){
		$(".ids").prop("checked", this.checked);
	});
	$(".ids").click(function(){
		var option = $(".ids");
		option.each(function(i){
			if(!this.checked){
				$(".check-all").prop("checked", false);
				return false;
			}else{
				$(".check-all").prop("checked", true);
			}
		});
	});

    //ajax get请求
    $('.ajax-get').click(function(){
        var that = this;
        if ( $(that).hasClass('confirm') ) {
            cf($(that).data('tip'), function(re){
                if(re){
                    ajax_get(that);
                }
            });
        }else{
            ajax_get(that);
        }
        return false;
    });
    //ajax post submit请求
    $('.ajax-post').click(function(){
        var that = this;
        if ( $(that).hasClass('confirm') ) {
            cf($(that).data('tip'), function(re){
                if(re){
                    ajax_post(that);
                }
            });
        }else{
            ajax_post(that);
        }
        return false;
    });
});

function ajax_post(that){

    var target,query,form;
    var target_form = $(that).attr('target-form');

    if( ($(that).attr('type')=='submit') || (target = $(that).attr('href')) || (target = $(that).attr('url')) ){
        var wait = $(that).data('wait');
        showLoading(wait);
        $(that).addClass('disabled');
        form = $('.'+target_form); //得到表单
        if (form.get(0)==undefined){
            return false;
        }else if ( form.get(0).nodeName=='FORM' ){ //form表单
            if($(that).attr('url') !== undefined){
                target = $(that).attr('url');
            }else{
                target = form.get(0).action;
            }
            query = form.serialize();
        }else if( form.get(0).nodeName=='INPUT' || form.get(0).nodeName=='SELECT' || form.get(0).nodeName=='TEXTAREA') {
            query = form.serialize();
        }else{
            query = form.find('input,select,textarea').serialize();
        }

        var editDiv = $('div[contenteditable=true]'); //自定义编辑器
        for(var i=0; i<editDiv.length;i++){
            var html = $(editDiv[i]).html();
            var name = $(editDiv[i]).data('name');
            query += ("&"+name+"="+encodeURIComponent(html));
        }

        var cityFiled = $('.city_field'); //地区
        for(var i=0; i<cityFiled.length; i++){
            var name =  $(cityFiled[i]).data('name');
            var valueArray = new Array();
            var select = $(cityFiled[i]).find('select');

            for(var j=0; j<select.length; j++){
                var value = $(select.get(j)).val();
                if(value==0){
                    removeLoading();
                    $(that).removeClass('disabled');
                    errorAlert("请完善地址信息！");
                    return;
                }
                if(value !== null){
                    valueArray.push(value);
                }
            }
            query += ("&"+name+"="+valueArray.join(','));
        }

        $.post(target,query).success(function(data){
            removeLoading();
            if (data.status==1) {
                if (data.url) {
                    okAlert(data.msg + ' 页面即将自动跳转~');
                }else{
                    okAlert(data.msg);
                }
                setTimeout(function(){
                    if (data.url) {
                        $(that).removeClass('disabled');
                        location.href=data.url;
                    }else if( $(that).hasClass('no-refresh')){
                        $(that).removeClass('disabled');
                        removeAlert();
                    }else{
                        $(that).removeClass('disabled');
                        location.reload();
                    }
                },1500);
            }else{
                errorAlert(data.msg);
                setTimeout(function(){
                    if (data.url) {
                        $(that).removeClass('disabled');
                        location.href=data.url;
                    }else{
                        $(that).removeClass('disabled');
                        removeAlert();
                    }
                },1500);
            }
        });
    }
}

    /**
     * 通用ajax get方法
     * 一般用于单点操作
     * @param that
     */
function ajax_get(that){
    var target;
    if ( (target = $(that).attr('href')) || (target = $(that).attr('url')) ) {
        $(that).addClass('disabled');
        var wait = $(that).data('wait');
        $.get(target).success(function(data){
            removeLoading();
            if (data.status==1) {
                if (data.url) {
                    okAlert(data.msg + ' 页面即将自动跳转~');
                }else{
                    okAlert(data.msg);
                }
                setTimeout(function(){
                    if (data.url) {
                        $(that).removeClass('disabled');
                        location.href=data.url;
                    }else if( $(that).hasClass('no-refresh')){
                        $(that).removeClass('disabled');
                        removeAlert();
                    }else{
                        $(that).removeClass('disabled');
                        location.reload();
                    }
                },1500);
            }else{
                errorAlert(data.msg);
                setTimeout(function(){
                    if (data.url) {
                        location.href=data.url;
                    }else{
                       removeAlert();
                    }
                },1500);
            }
        });

    }
}

function errorAlert(text,title){
    title = (title===undefined?'':title);
    updateAlert(text,title,'gritter-error');
}

function okAlert(text,title){
    title = (title===undefined?'':title);
    updateAlert(text,title,'gritter-success');
}
function infoAlert(text,title){
    title = (title===undefined?'':title);
    updateAlert(text,title,'gritter-info');
}

function updateAlert(text , title, style){
    $.gritter.add({
        title: title,
        text: text,
        class_name: style+' gritter-center'
    });
}

function removeAlert(){
    $.gritter.removeAll();
}

function showLoading(wait){
    $('.modal').modal('hide');
    wait=(wait ===undefined?'':wait);
    $('.page-content').append('<div class="message-loading-overlay"><i style="top: 50%" class="icon-spin icon-spinner orange2 bigger-200"></i><div class="overlay-tip">'+wait+'</div></div>');
}

function changeLoadingTip(str){
    $('.message-loading-overlay .overlay-tip').empty.html(str);
}

function removeLoading(){
    $('.page-content').find('.message-loading-overlay').remove();
}

function showProgress(tip,type){
    $('.modal').modal('hide');
    var progress = '';
    if(type===0){//没有进度
        progress='<i style="top: 50%" class="icon-spin icon-spinner orange2 bigger-200"></i>';
    }else{
        progress='<div class="progress progress-striped"> <div class="progress-bar progress-bar-purple" style="width: 1%"></div> </div>';
    }
    tip=(tip ===undefined?'':tip);
    $('body').append('<div class="message-loading-overlay progress-bg">' +
        '<div class="progress-overlay ">'+progress+'</div>' +
        '<div class="overlay-tip">' +tip+
        '</div>'+
        '</div>');
}

function changeProgress(rate,str){
    if(str){
        $('.progress-bar').css('width','100%');
        $('.message-loading-overlay .overlay-tip').empty().html(str);
    }else{
        $('.progress-bar').css('width',rate+'%');
    }
}
function removeProgress(){
    $('body').find('.message-loading-overlay').remove();
}

function cf(tip,func){
    bootbox.confirm(tip===undefined?'确定执行此操作么?':tip,func);
}

/**
 * 实例化模板
 * 第一个参数是模板id,
 * 其他参数是模板数据
 */
function InstanceTpl() {
    var tpl = $("#" + arguments[0]).clone(true);

    var dataKeys = $(tpl).find("*[data-key]");

    if ($(tpl).attr("data-key") !== undefined) {
        dataKeys.splice(0, 0, tpl);
    }

    for (var i = 1; i < arguments.length; i++) {
        var dataValueObj = arguments[i];
        for (var item in dataValueObj) {
            var parts = item.split("_");
            var itemValue = dataValueObj[item];
            var dataType = parts[0];

            if (dataType == "style") {

                $(dataKeys[i - 1]).css(parts[1], itemValue);

            } else if (dataType == "src") {

                $(dataKeys[i - 1]).attr("src", itemValue);

            } else if (dataType == "html") {

                if (itemValue instanceof Object) {

                    $(dataKeys[i - 1]).empty().append(itemValue);

                } else {

                    $(dataKeys[i - 1]).html(itemValue);

                }
            } else if (dataType == "text") {

                $(dataKeys[i - 1]).text(itemValue);

            } else if (dataType == "data") {
                dataKeys[i - 1][parts[1]] = itemValue;

            } else if (dataType == "id") {

                $(dataKeys[i - 1]).attr("id", itemValue);

            } else if (dataType == "name") {

                $(dataKeys[i - 1]).attr("name", itemValue);

            } else if (dataType == "append") {

                $(dataKeys[i - 1]).append(itemValue);

            } else if (dataType == "addClass") {

                $(dataKeys[i - 1]).addClass(itemValue);

            } else if (dataType == "removeClass") {

                $(dataKeys[i - 1]).removeClass(itemValue);

            }
        }

        $(dataKeys[i - 1]).removeAttr("data-key");
    }

    $(tpl).removeAttr("id");
    return tpl;
}

function shake(ele) {
    $(ele).addClass("shake");
    setTimeout(function() {
        $(ele).removeClass("shake");
    }, 1000);
}
