package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myMemberDao")
public class MemberDao {

	private String namespace = "member.model.MemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
		System.out.println("확인 수량"+cnt);
		return cnt;
	}

	public List<MemberBean> getMemberList(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getMemberList",map,rowBounds);
		System.out.println(lists);
		return lists;
	}

	public int insertMember(MemberBean member) {
		
		int cnt = sqlSessionTemplate.insert(namespace+".insertMember",member);
		System.out.println("Insert cnt:"+cnt);
		return cnt;
	}

	public MemberBean getData(String id) {
				
		MemberBean member = sqlSessionTemplate.selectOne(namespace+".getData", id);
		
		return member;
	}

}
