package reservation.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BalanceDao {
	
	private String namespace = "reservation.model.BalanceBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public BalanceBean getBalance(int memberNum) {
		BalanceBean balance = sqlSessionTemplate.selectOne(namespace+".getBalance",memberNum);
		return balance;
	}

	public int insertBalance(BalanceBean balanceBean) {
		return sqlSessionTemplate.insert(namespace+".insertBalance", balanceBean);
	}

	public int updateBalance(BalanceBean balanceBean) {
		return sqlSessionTemplate.update(namespace+".updateBalance", balanceBean);
		
	}

	public BalanceBean getBalanceByMemberNum(int memberNum) {
		return sqlSessionTemplate.selectOne(namespace+".getBalanceByMemberNum", memberNum);
	}
}
