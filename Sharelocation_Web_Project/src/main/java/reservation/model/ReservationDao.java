package reservation.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
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

	public int reservInsert(ReservationBean reservationBean) {
		int cnt = sqlSessionTemplate.insert(namespace+".reservInsert",reservationBean);
		return cnt;
	}

	public List<ReservationBean> getReservList(int membernum,Paging pageInfo) {
		
		List<ReservationBean> reservationLists = new ArrayList<ReservationBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		reservationLists = sqlSessionTemplate.selectList(namespace+".getReservList",membernum,rowBounds);
		return reservationLists;
	}

	public int deleteReserv(int num) {
		int cnt= sqlSessionTemplate.delete(namespace+".deleteReserv",num);
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

	public List<ReservationBean> getExpiredReservationList() {
		return sqlSessionTemplate.selectList(namespace+".getExpiredReservationList");
	}

	public List<ReservationBean> getCompleteReservationList() {
		return sqlSessionTemplate.selectList(namespace+".getCompleteReservationList");
	}

	public int getCompleteReservationCount() {
		return sqlSessionTemplate.selectOne(namespace+".getCompleteReservationCount");
	}

	public TypeRankingBean getTypeRankingBest() {
		return sqlSessionTemplate.selectOne(namespace+".getTypeRankingBest");
	}

	public List<DayOfWeekCountBean> getDayOfWeekCount() {
		return sqlSessionTemplate.selectList(namespace+".getDayOfWeekCount", "dayOfWeek");
	}
	public int reservationCancel(int num) {
		return sqlSessionTemplate.update(namespace+".reservationCancel",num);
	}
}
