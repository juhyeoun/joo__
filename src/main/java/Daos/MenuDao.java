package Daos;

import java.util.List;
import java.util.Map;

public interface MenuDao {
   
   public List<Map<String, Object>>findAll();//안찾을떄
   public List<Map<String, Object>>findByLtitle(String ltitle);//변수가 한개일때
   public List<Map<String, Object>>findByLtitleAndStitle(Map<String, Object>map);//두개 이상일때 map사용
   public List<Map<String, Object>>findByStitle(String stitle);
   public List<Map<String, Object>>findByProductName(String productName);
   public List<Map<String, Object>>findR(String productName);
   public List<Map<String, Object>>findL(String productName);
}