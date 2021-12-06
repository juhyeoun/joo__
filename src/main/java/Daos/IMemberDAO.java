package Daos;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mrpizzahut.app.member.dto.MemberDTO;
import com.mrpizzahut.app.member.dto.PagingVO;
import com.mrpizzahut.app.order.OrderDTO;

@Repository
public interface IMemberDAO {
	public int EmailCheck(String email);
	public Map<String, Object>findByEmail(String email);
	public int joinSuccessProc(MemberDTO member);
	public MemberDTO loginMember(MemberDTO member);
	public MemberDTO check(MemberDTO member);
	public MemberDTO findEmail(MemberDTO member);
	public MemberDTO findMobile(String phone);
	public int updatePw(MemberDTO member);
	public MemberDTO findPw(MemberDTO member);
	public int delete(MemberDTO member);
	public MemberDTO makeNewPw(MemberDTO member);
	public MemberDTO chkOldPw(MemberDTO member);
	public int updateProc(MemberDTO member);
	public ArrayList<MemberDTO> list();
	public int adminUpdateMember(MemberDTO member);
	public MemberDTO memberName(String name);
	public MemberDTO adminPw(MemberDTO member);
	public List<MemberDTO> selectList(MemberDTO member);
	public ArrayList<OrderDTO> orderList();
	public List<OrderDTO> selectOrderList(OrderDTO order);
	public List<MemberDTO> selectBoard(PagingVO vo);
	public int countBoard();
}
