package Daos;

import java.util.List;
import java.util.Map;

public interface payDao {
	public Map<String, Object>findByPizzaName(Map<String, Object>map);
	public int insert(Map<String, Object>map);
	public int insertCard(Map<String, Object>map);
	public int insertVbank(Map<String, Object>map);
	public int insertKpay(Map<String, Object>map);
	public Map<String, Object> cardFindByMchtTrdNo(String mchtTrdNo);
	public int updateCardDonflag(Map<String, Object>map);
	public int updateCardCancleFlag(Map<String, Object>map);
	public int updateOrderDoneFlag(Map<String, Object>map);
	public int updateOrderCancleFlag(Map<String, Object>map);
	public List<Map<String, Object>>OrderFindByMchtTrdNo(String mchtTrdNo);
	public int orderUpdateCount(Map<String, Object>map);
	public Map<String, Object>kpayFindByyMchtTrdNo(String email);
	public int kpayUpdateDoneFlag(Map<String, Object>map);
	public int kpayUpdateCancleFlag(Map<String, Object>map);
	public Map<String, Object> vbankFindByMchtTrdNo(String mchtTrdNo);
	public int vbankUpdateVtlAcntNo(Map<String, Object>map);
	public int updateVbankDoneFlag(Map<String, Object>map);
	public int updateOrderCanclePay(Map<String, Object>map);
	public int updateCardCancleTime(Map<String, Object>map);
	public int updateKpayCancleTime(Map<String, Object>map);
}
