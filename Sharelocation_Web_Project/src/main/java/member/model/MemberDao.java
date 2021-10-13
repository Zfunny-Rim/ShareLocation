package member.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mdao")
public class MemberDao {
	
	private String namespace = "member.model.MemberBean.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MemberBean getData(String id) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+"getData",id);
		return member;
	}

	public void insertMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace+"insertMember",member);
	}

	public MemberBean getIdPw(Map<String, String> map) {
		MemberBean idpw = sqlSessionTemplate.selectOne(namespace+"getIdPw",map);
		return idpw;
	}

	public void updateMember(MemberBean member) {
		sqlSessionTemplate.update(namespace+"updateMember",member);
	}

	public MemberBean getNickname(String problem_nickname) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+"getNickname",problem_nickname);
		return member;
	}

	public int deleteMember(String id, String password) {
		MemberBean member = new MemberBean();
		member.setId(id);
		member.setPassword(password);
		return sqlSessionTemplate.delete(namespace+"deleteMember",member);
	}

	public MemberBean getLoginData(Map<String, String> map) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+"getLoginData",map);
		return member;
	}

	public void updateFindMember(MemberBean member) {
		sqlSessionTemplate.update(namespace+"updateFindMember",member);
	}

	public MemberBean getMemberByNum(int membernum) {
		return sqlSessionTemplate.selectOne(namespace+"getMemberByNum", membernum);  
	}

}