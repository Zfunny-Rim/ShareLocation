package income.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myIncomeDao")
public class IncomeDao {
	private String namespace = "income.model.IncomeBean";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public int insertIncome(IncomeBean incomeBean) {
		return sqlSessionTemplate.insert(namespace+".insertIncome", incomeBean);
	}
	public Integer getTotalIncomePriceBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalIncomePriceBySpaceNum", spaceNum);
	}
	public Integer getTotalExpensePriceBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalExpensePriceBySpaceNum", spaceNum);
	}
	public Integer getIncomePriceByMonthAndSpaceNum(Map<String, Object> queryParam) {
		return sqlSessionTemplate.selectOne(namespace+".getIncomePriceByMonthAndSpaceNum", queryParam);
	}
	public Integer getExpensePriceByMonthAndSpaceNum(Map<String, Object> queryParam) {
		return sqlSessionTemplate.selectOne(namespace+".getExpensePriceByMonthAndSpaceNum", queryParam);
	}
	public List<IncomeBean> getIncomeListByMonth(Map<String, Object> queryParam) {
		return sqlSessionTemplate.selectList(namespace+".getIncomeListByMonth", queryParam);
	}
	
}
