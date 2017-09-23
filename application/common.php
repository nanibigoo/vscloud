<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use vsLang\VsLang;
use think\facade\Session;

// 应用公共文件

/**
 * 获取语言变量值
 */
function vslang($name, $vars = [], $lang = '')
{
    return VsLang::get($name, $vars, $lang);
}

// 是否登录
function is_login()
{
    $user = Session::get('king_auth');
    if(!$user){
        return 0;
    }else{
        return Session::get('king_auth_sign') == data_auth_sign($user) ? $user : 0;
    }
}

/**
 * 数据签名认证
 */
function data_auth_sign($data) {
    //数据类型检测
    if(!is_array($data)){
        $data = (array)$data;
    }
    ksort($data); //排序
    $code = http_build_query($data); //url编码并生成query字符串
    $sign = sha1($code); //生成签名
    return $sign;
}

// 设置密码
function set_password($code)
{
    return sha1($code);
}