package com.service;

import org.springframework.stereotype.Component;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.URL;


import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.City;
import com.maxmind.geoip2.record.Country;
import com.maxmind.geoip2.record.Subdivision;
import com.pojo.GeoLocation;

@Component
public class GeoLocationService {
    private DatabaseReader reader;
    private static Logger logger = LoggerFactory.getLogger(GeoLocationService.class);


    public GeoLocationService() {
        String dataFile = "resource/GeoLite2-City.mmdb";
        URL url = getClass().getClassLoader().getResource(dataFile);


        if (url == null) {
            System.err.println("location database is not found - " + dataFile);
        } else {
            try {
                File database = new File(url.getPath());
                reader = new DatabaseReader.Builder(database).build();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 获取ip地址映射的国家
     * @param ipAddress
     * @return
     */
    public GeoLocation getLocationFromRequest(String ip) {
        GeoLocation location = getLocationV2(ip);
        return location;
    }

    /**
     * 获取ip地址
     * @param request
     * @return
     */
    public String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        logger.info("Ip from user agent: {}", ip);
        // 多个反向代理IP时，取第一个
        int commaOffset = ip.indexOf(',');
        if (commaOffset < 0) {
            ip = ip.equals("0:0:0:0:0:0:0:1") ? "61.183.88.58" : ip;
            return ip;
        }
        ip = ip.substring(0, commaOffset);

        ip = ip.equals("0:0:0:0:0:0:0:1") ? "61.183.88.58" : ip;

        return ip;
    }


    /**
     * 获取ip地址映射的国家
     * @param ipAddress
     * @return
     */
    private GeoLocation getLocationV2(String ipAddress) {
        GeoLocation geoLocation = null;
        if (null == reader) {
            //System.err.println("location database is not found.");
            logger.error("location database is not found.");
        } else {
            try {
                geoLocation = new GeoLocation();
                InetAddress ipAdd = InetAddress.getByName(ipAddress);
                CityResponse response = reader.city(ipAdd);


                Country country = response.getCountry();
                geoLocation.setCountryCode(country.getIsoCode());
                geoLocation.setCountryName(country.getName());


                Subdivision subdivision = response.getMostSpecificSubdivision();
                geoLocation.setRegionName(subdivision.getName());


                City city = response.getCity();
                geoLocation.setCity(city.getName());
                geoLocation.setPostalCode(response.getPostal().getCode());
                geoLocation.setLatitude(String.valueOf(response.getLocation().getLatitude()));
                geoLocation.setLongitude(String.valueOf(response.getLocation().getLongitude()));
            } catch (IOException e) {
                e.printStackTrace();
                logger.error(e.getMessage());
            } catch (GeoIp2Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage());
            }
        }
        return geoLocation;
    }
}
