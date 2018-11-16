package kr.or.ddit.schedule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.schedule.dao.ScheduleDaoInf;
import kr.or.ddit.schedule.model.ScheduleVo;

@Service("scheduleService")
public class ScheduleService implements ScheduleServiceInf{

	@Resource(name="scheduleDao")
	ScheduleDaoInf scheduleDao;
	
	@Override
	public List<ScheduleVo> getSchedule(int id) {
		return scheduleDao.getSchedule(id);
	}

	@Override
	public int insertSchedule(ScheduleVo scheduleVo) {
		return scheduleDao.insertSchedule(scheduleVo);
	}

	@Override
	public int deleteSchedule(int scheduleID) {
		return scheduleDao.deleteSchedule(scheduleID);
	}

	@Override
	public List<ScheduleVo> proNumSchedule(int pro_num) {
		return scheduleDao.proNumSchedule(pro_num);
	}

}
