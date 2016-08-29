/**
 * Created by chenweiyu on 2016/7/18.
 */

/*define(function (require, exports, module) {

});*/


(function(factory) {

    if(typeof define === 'function'){

        define(factory);

    }else{

        factory();
    }

})(function(require){

    /**设置root fontsize ，rem兼容设备，设计稿为640px*/
    var deviceWidth = document.documentElement.clientWidth;
    if (deviceWidth > 640) {
        deviceWidth = 640;
    }
    document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
    // console.log(deviceWidth);
//    绑定通用事件-返回上一页
//     var $ = require('../lib/zepto.min');
//     $(document.body).find('header .back,footer .back').on('tap',function () {
//         history.go(-1);
//     });
});

