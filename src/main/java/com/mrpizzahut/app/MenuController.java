package com.mrpizzahut.app;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Daos.MenuDao;
import Daos.buketDao;

@Controller
public class MenuController {
   final static Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @Autowired
   private MenuDao menuDao;
   
   @Autowired
   private buketDao bucketDao;
   
   
   @RequestMapping(value = "/premium" , method=RequestMethod.GET)
   public String premium(HttpServletRequest request,HttpServletResponse response,Model model) {
      String scope=request.getParameter("scope");
      System.out.println("스코프 "+scope);
      if(scope.equals("stitle")) {
         String stitle=request.getParameter("stitle");
         System.out.println("타이틀별 요청 "+stitle);
         stitle=stitle.replace("%20", "");
         System.out.println(stitle);
         List<Map<String, Object>>maps2=menuDao.findByStitle(stitle);
         System.out.println(maps2.toString());
         if(stitle.equals("프리미엄 피자")) {
            model.addAttribute("detail", 1);
         }else if(stitle.equals("씬 크러스트 피자")) {
            model.addAttribute("detail", 2);
         }else if(stitle.equals("클래식 피자")) {
            model.addAttribute("detail", 3);
         }
         model.addAttribute("products", maps2);
      }else if(scope.equals("ltitle")) { //여기코드작성
         String ltitle=request.getParameter("ltitle");
         System.out.println("모두보기 요청");
         ltitle=ltitle.replace("%20", "");
         List<Map<String, Object>>maps3=menuDao.findByLtitle(ltitle);
         System.out.println(maps3.toString());
         model.addAttribute("detail", 4);
         model.addAttribute("products", maps3);
      }
      
      return "menu/premium";
   }

   @RequestMapping(value = "/pizzasand")
   public String pizzasand(HttpServletRequest request,HttpServletResponse response,Model model) {
      String scope=request.getParameter("scope");
      System.out.println("스코프 "+scope);
      if(scope.equals("stitle")) {
         String stitle=request.getParameter("stitle");
         System.out.println("타이틀별 요청 "+stitle);
         stitle=stitle.replace("%20", "");
         System.out.println(stitle);
         List<Map<String, Object>>maps2=menuDao.findByStitle(stitle);
         System.out.println(maps2.toString());
         model.addAttribute("products", maps2);
      }
      
      return "menu/pizzasand";
   }
   @RequestMapping(value = "/doublethin")
   public String doublethin(HttpServletRequest request,HttpServletResponse response,Model model) {
      String scope=request.getParameter("scope");
      System.out.println("스코프 "+scope);
      if(scope.equals("stitle")) {
         String stitle=request.getParameter("stitle");
         System.out.println("타이틀별 요청 "+stitle);
         stitle=stitle.replace("%20", "");
         System.out.println(stitle);
         List<Map<String, Object>>maps2=menuDao.findByStitle(stitle);
         System.out.println(maps2.toString());
         if(stitle.equals("더블씬세트")) {
            model.addAttribute("detail", 1);
         }else if(stitle.equals("미니복희세트")) {
            model.addAttribute("detail", 2);
         }else if(stitle.equals("보너스파우치")) {
            model.addAttribute("detail", 3);
         }else if(stitle.equals("홈런박스")) {
            model.addAttribute("detail", 4);
         }
         model.addAttribute("products", maps2);
      }else if(scope.equals("ltitle")) { //여기코드작성
         String ltitle=request.getParameter("ltitle");
         System.out.println("모두보기 요청");
         ltitle=ltitle.replace("%20", "");
         List<Map<String, Object>>maps3=menuDao.findByLtitle(ltitle);
         System.out.println(maps3.toString());
         model.addAttribute("detail", 5);
         model.addAttribute("products", maps3);
      }
      return "menu/doublethin";
   }
   @RequestMapping(value = "/appetizer")
   public String appetizer(HttpServletRequest request,HttpServletResponse response,Model model) {
      String scope=request.getParameter("scope");
      System.out.println("스코프 "+scope);
      if(scope.equals("stitle")) {
         String stitle=request.getParameter("stitle");
         System.out.println("타이틀별 요청 "+stitle);
         stitle=stitle.replace("%20", "");
         System.out.println(stitle);
         List<Map<String, Object>>maps2=menuDao.findByStitle(stitle);
         System.out.println(maps2.toString());
         if(stitle.equals("샐러드/사이드")) {
            model.addAttribute("detail", 1);
         }else if(stitle.equals("파스타/라이스")) {
            model.addAttribute("detail", 2);
         }else if(stitle.equals("음료")) {
            model.addAttribute("detail", 3);
         }
         model.addAttribute("products", maps2);
      }else if(scope.equals("ltitle")) { //여기코드작성
         String ltitle=request.getParameter("ltitle");
         System.out.println("모두보기 요청");
         ltitle=ltitle.replace("%20", "");
         List<Map<String, Object>>maps3=menuDao.findByLtitle(ltitle);
         System.out.println(maps3.toString());
         model.addAttribute("detail", 4);
         model.addAttribute("products", maps3);
      }
      return "menu/appetizer";
   }
   
   
   @RequestMapping(value = "/productView" ,method = RequestMethod.GET)
   public String productView(HttpServletRequest request,HttpServletResponse response,Model model) {
      System.out.println("productView");   
      String mname=request.getParameter("Mname");
      System.out.println("조회 상품 "+mname);
      List<Map<String, Object>>product=menuDao.findByProductName(mname);
      List<Map<String, Object>>rProduct=menuDao.findR(mname);
      System.out.println(rProduct);
      List<Map<String, Object>>lProduct=menuDao.findL(mname);
      System.out.println(lProduct);
      System.out.println("조회 상품 결과 "+product.toString());
      if(product.get(0).get("EDGE")!=null) {
         List<String>Edges=new ArrayList<String>();
         for(Map<String, Object>map:product) {
            String edge=map.get("EDGE").toString();
            if(!Edges.contains(edge)) {
               Edges.add(edge);
            }
            
         }
         model.addAttribute("edges", Edges);
      }
      if(product.get(0).get("MSIZE")!=null) {
         List<String>mSizes=new ArrayList<String>();
         for(Map<String, Object>map:product) {
            String mSize=map.get("MSIZE").toString();
            if(!mSizes.contains(mSize)) {
               mSizes.add(mSize);
            }
         }
         model.addAttribute("mSizes", mSizes);
      }
      System.out.println("상품조회성공");
      model.addAttribute("product", product);
      model.addAttribute("rProduct", rProduct);
      model.addAttribute("lProduct", lProduct);
      return "menu/productView";
   }
   
   
   
   
   @RequestMapping(value = "/test")
   public void test(@RequestBody JSONObject json) {
      System.out.println("test");
   }
   
}