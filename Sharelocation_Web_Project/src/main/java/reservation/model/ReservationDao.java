package reservation.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import space.model.SpaceBean;
import utility.Paging;

@Component("myReservationDao")
public class ReservationDao {
	
	private String namespace = "reservation.model.ReservationBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ReservationBean getReserv(int spaceNum) {
		ReservationBean bean = sqlSessionTemplate.selectOne(namespace+".getReserv",spaceNum);
		return bean;
	}

	public int reservInsert(ReservationBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".reservInsert",bean);
		return cnt;
	}

	public int getReservationTotalCountByMap(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getReservationTotalCountByMap", map);
	}

	public List<ReservationBean> getReservationListByMap(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getReservationListByMap", map, rowBounds);
	}

	public ReservationBean getReservationByNum(int num) {
		return sqlSessionTemplate.selectOne(namespace+".getReservationByNum", num);
	}

	public int updateStatus(ReservationBean reservationBean) {
		return sqlSessionTemplate.update(namespace+".updateStatus", reservationBean);
	}
}
