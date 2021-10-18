package scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import space.model.AdvertiseBean;
import space.model.SpaceBean;
import space.model.SpaceDao;

@Component("myQueryScheduler")
public class QueryScheduler {
	@Autowired
	ReservationDao reservationDao;
	@Autowired
	SpaceDao spaceDao;
	
	//0 0 0/1 * * ? : 한시간에 한번씩 만료 체크
	@Scheduled(cron = "0 0 0/1 * * ?")
	public void expireSchduler() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println("스케쥴러 테스트!"+sdf.format(Calendar.getInstance().getTime()));
		List<ReservationBean> exResList = reservationDao.getExpiredReservationList();
		if(exResList.size() != 0) {
			for(ReservationBean resBean:exResList) {
				resBean.setStatus("예약취소");
				reservationDao.updateStatus(resBean);
			}
		}
		List<ReservationBean> comResList = reservationDao.getCompleteReservationList();
		if(comResList.size() != 0) {
			for(ReservationBean resBean:comResList) {
				resBean.setStatus("이용완료");
				reservationDao.updateStatus(resBean);
			}
		}
		List<AdvertiseBean> adExpiredList = spaceDao.getExpiredAdvertiseList();
		if(adExpiredList.size() != 0) {
			for(AdvertiseBean adBean:adExpiredList) {
				int spaceNum = adBean.getSpacenum();
				SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
				spaceBean.setGrade("기본");
			}
		}
		
	}
}