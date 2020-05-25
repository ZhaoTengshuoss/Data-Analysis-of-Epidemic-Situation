package com.BigData.Dao;

import java.util.List;

import com.BigData.model.All_data;
import com.BigData.model.C_data;
import com.BigData.model.Line;
import com.BigData.model.NH_data;
import com.BigData.model.N_data;
import com.BigData.model.Personline;
import com.BigData.model.Simpledata;
import com.BigData.model.Text_data;
import com.BigData.model.Virus;


public interface UserDao {	
	public List<Virus> loads();
	public List<Personline> loads_P();
	public Virus load_data1(String province);
	public Virus load_data2(String area);
	public List<Personline> load(String data);
	public Simpledata load_SD(String date);
	public List<Text_data> load_T();
	
	public List<Line> load_L();
	public List<Line> load_NL();
	public List<Line> load_NL2(String content);
	public List<N_data> load_ND();
	public List<N_data> load_ND2();
	public List<C_data> load_NC();
	public List<NH_data> load_NH();
	
	
	public List<All_data> load_all(String infotype);
	public List<All_data> load_all2(String province);
	
	
}

