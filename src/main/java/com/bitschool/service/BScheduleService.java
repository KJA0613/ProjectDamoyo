package com.bitschool.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BScheduleDAO;
import com.bitschool.dto.BScheduleDTO;
import com.bitschool.dto.BScheduleFormatDTO;

@Service
public class BScheduleService {
	
	@Inject
	private BScheduleDAO dao;
	
	public boolean registSchedule(BScheduleDTO schedule) {
		boolean flag = false;
		flag = dao.insertSchedule(schedule);
		return flag;
	}
	
	public boolean modifySchedule(BScheduleDTO schedule) {
		boolean flag = false;
		flag = dao.updateSchedule(schedule);
		return flag;
	}

	public List<BScheduleFormatDTO> getScheduleAll() {
		List<BScheduleFormatDTO> list = new ArrayList<BScheduleFormatDTO>();
		List<BScheduleDTO> templist = dao.selectScheduleAll();
		for(int i=0;i<templist.size();i++) {
			BScheduleFormatDTO dto = new BScheduleFormatDTO();
			BScheduleDTO temp = templist.get(i);
			dto.setTitle(temp.getMarkedContents());
			dto.setStart(temp.getStartDate());
			dto.setEnd(temp.getEndDate());
			dto.setId(temp.getSid());
			String tempStr = temp.getEndDate().split("-")[2];
			int tempEnd = Integer.parseInt(tempStr)+1;
			String end;
			if(tempEnd<10) {
				end = temp.getEndDate().split("-")[0] + "-" + temp.getEndDate().split("-")[1] + "-0" + tempEnd;
			} else {
				end = temp.getEndDate().split("-")[0] + "-" + temp.getEndDate().split("-")[1] + "-" + tempEnd;
			}
			dto.setEnd(end);
			dto.setDetailedContents(temp.getDetailedContents());
			list.add(dto);
		}
		return list;
	}

	public BScheduleDTO readScheduleOne(int sid) {
		BScheduleDTO schedule = null;
		schedule = dao.selectScheduleOne(sid);
		return schedule;
	}

	public boolean removeSchedule(int sid) {
		boolean flag = false;
		flag = dao.deleteSchedule(sid);
		return flag;
	}
}
