package Daos;

import java.util.List;
import java.util.Map;

public interface EventDAO {
   public List<Map<String, Object>>selectOne(String eTitle);
   public List<Map<String, Object>>showList();
   
}