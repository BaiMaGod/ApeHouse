package com.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class MyUtil {

    /**
     * 保存本web服务项目在磁盘中的真实路径
     */
    private static String serverPath = "D:\\E\\eclipseSpace\\ssmTest3\\WebContent\\";

    public static void setServerPath(String path){
        serverPath = path;
    }
    public static String getServerPath(){
        return serverPath;
    }

    /**
     * 生成UUID,32位
     * @return id
     */
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        //去掉随机ID的短横线
        id = id.replace("-", "");

        return id;
    }

    /**
     * 生成表ID,纯数字，递增，22位左右
     * @return id
     */
    public static String getTableId() {
        //取UUID的哈希码，换成纯数字
        int num = getUUID().hashCode();
        //去绝对值
        num = num < 0 ? -num : num;
//		在生成的随机数字前加入时间戳，形成递增
        return String.valueOf(System.currentTimeMillis()) + num;
    }


    /**
     * 生成当前时间
     */
    public static Date nowDate(){
        Date date = new Date();
        return new Timestamp(date.getTime());
    }

    /**
     * 生成当前时间
     */
    public static String nowTime(){
        String nowTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());

        return nowTime;
    }

    /**
     * 密码加密方法
     */
    public static String md5(String psw) {
        //md5加密
        return DigestUtils.md5Hex(psw);
    }

    /**
     * 将文件存入磁盘中,路径在本项项目WebContent目录下
     */
    public static String fileSave(MultipartFile file, String path){
        String realPath = serverPath + path;
        File targetDir = new File(realPath);
        if(!targetDir.exists()){
            targetDir.mkdirs();
        }

//        获得原文件名
        String fileName = file.getOriginalFilename();
//        获得原文件后缀名
        String fileSuffix = fileName.substring(fileName.lastIndexOf(".")+1);
//        防止文件重名,随机生成文件的存储名
        String memoryName = MyUtil.getUUID()+"."+fileSuffix;

//        生成文件src路径，存入数据库中
        String src = path + memoryName;
        File targetFile = new File(realPath,memoryName);
//         保存到磁盘
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return src;
    }

    /**
     * 删除本项目下的文件
     */
    public static void deleteFile(String path){
        String absolutePath = serverPath + path;
        File file = new File(absolutePath);
        file.delete();
    }
}
