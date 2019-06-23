package com.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class MyUtil {

    /**
     * 保存本web服务项目在磁盘中的真实路径
     */
	public static String serverPath;
//    public static String serverPath = "D:\\E\\eclipseSpace\\ApeHouse\\src\\main\\webapp\\";


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
            * 生成短数字id,8位左右
     * @return id
     */
    public static String getShortId() {
        //取UUID的哈希码，换成纯数字
        int num = getUUID().hashCode();
        //去绝对值
        num = num < 0 ? -num : num;
        return String.valueOf(num);
    }

    /**
             * 生成长数字ID,纯数字，递增，23位左右
     * @return id
     */
    public static String getLongId() {
//		在生成的 短id 前加入时间戳，形成递增
        return String.valueOf(System.currentTimeMillis()) + getShortId();
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
     * 字符串数组乱序，并转为ArrayList<string>
     * @param datas 要乱序的数组
     * @param prefix    可在每个数据项中加前缀
     * @return
     */
    public static List<String> randomArray(String[] datas, String prefix){
        if(datas==null) return null;

        int len = datas.length;
        int k;
        String temp;
        for(int i=0;i<len;i++){
            while( (k = (int)(Math.random()*len)) == i){ }
            temp = datas[i];
            datas[i] = datas[k];
            datas[k] = temp;
        }

        List<String> resultList = new ArrayList<>();
        for(int i=0;i<len;i++){
            resultList.add(prefix+datas[i]);
        }
        return resultList;
    }





    /**
     * 获取本项目文件夹中子文件名
     * @param path
     * @return  字符串数组，子文件名
     */
    public static String[] getFileNames(String path){
        File file = new File(MyUtil.serverPath+path);
        if(!file.exists()) return null;

        return file.list();
    }



    /**
     * 将文件存入磁盘中,路径在本项项目WebContent目录下
     */
    public static String fileSave(MultipartFile file, String path){
        return fileSave(file,path,MyUtil.getLongId());
    }

    /**
     * 将文件存入磁盘中,路径在本项项目WebContent目录下,指定存储文件名
     */
    public static String fileSave(MultipartFile file, String path,String memoryName){
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
//        String memoryName = MyUtil.getLongId()+"."+fileSuffix;


        memoryName = memoryName + "."+fileSuffix;

//        生成文件src路径
        String src = path +"\\"+ memoryName;
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
    
    
    public static boolean notEmpty(String str) {
    	return str!=null && !"".equals(str.trim());
    }
}
