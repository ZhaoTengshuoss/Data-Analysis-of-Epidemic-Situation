package com.BigData.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.BigData.Dbconn.DBUtil;
import com.BigData.model.All_data;
import com.BigData.model.C_data;
import com.BigData.model.Line;
import com.BigData.model.NH_data;
import com.BigData.model.N_data;
import com.BigData.model.Personline;
import com.BigData.model.Simpledata;
import com.BigData.model.Text_data;
import com.BigData.model.Virus;


public class UserDaoImpl implements UserDao {

	@Override
	public List<Virus> loads() {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from all_data;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Virus> viruses = new ArrayList<Virus>();
		Virus virus = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				virus = new Virus();
				virus.setT_confirm(resultSet.getString("t_confirm"));
				virus.setT_suspect(resultSet.getString("t_suspect"));
				virus.setT_dead(resultSet.getString("t_dead"));
				virus.setT_heal(resultSet.getString("t_heal"));
				virus.setAll_confirm(resultSet.getString("all_confirm"));
				virus.setAll_suspect(resultSet.getString("all_suspect"));
				virus.setAll_dead(resultSet.getString("all_dead"));
				virus.setAll_heal(resultSet.getString("all_heal"));
				virus.setAll_deadRate(resultSet.getString("all_deadRate"));
				virus.setAll_healRate(resultSet.getString("all_healRate"));
				virus.setCountry(resultSet.getString("country"));
				virus.setProvince(resultSet.getString("province"));
				virus.setArea(resultSet.getString("area"));
				virus.setInfotype(resultSet.getString("infotype"));
				viruses.add(virus);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  viruses;
	}

	@Override
	public Virus load_data1(String province) {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from all_data where infotype= \"province\" and  province = ?;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		/*List<Virus> viruses = new ArrayList<Virus>();*/
		Virus virus = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,province);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				virus = new Virus();
				virus.setT_confirm(resultSet.getString("t_confirm"));
				virus.setT_suspect(resultSet.getString("t_suspect"));
				virus.setT_dead(resultSet.getString("t_dead"));
				virus.setT_heal(resultSet.getString("t_heal"));
				virus.setAll_confirm(resultSet.getString("all_confirm"));
				virus.setAll_suspect(resultSet.getString("all_suspect"));
				virus.setAll_dead(resultSet.getString("all_dead"));
				virus.setAll_heal(resultSet.getString("all_heal"));
				virus.setAll_deadRate(resultSet.getString("all_deadRate"));
				virus.setAll_healRate(resultSet.getString("all_healRate"));
				virus.setCountry(resultSet.getString("country"));
				virus.setProvince(resultSet.getString("province"));
				virus.setArea(resultSet.getString("area"));
				virus.setInfotype(resultSet.getString("infotype"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  virus;
	}

	@Override
	public Virus load_data2(String area) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from all_data where  area = ?;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Virus virus = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,area);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				virus = new Virus();
				virus.setT_confirm(resultSet.getString("t_confirm"));
				virus.setT_suspect(resultSet.getString("t_suspect"));
				virus.setT_dead(resultSet.getString("t_dead"));
				virus.setT_heal(resultSet.getString("t_heal"));
				virus.setAll_confirm(resultSet.getString("all_confirm"));
				virus.setAll_suspect(resultSet.getString("all_suspect"));
				virus.setAll_dead(resultSet.getString("all_dead"));
				virus.setAll_heal(resultSet.getString("all_heal"));
				virus.setAll_deadRate(resultSet.getString("all_deadRate"));
				virus.setAll_healRate(resultSet.getString("all_healRate"));
				virus.setCountry(resultSet.getString("country"));
				virus.setProvince(resultSet.getString("province"));
				virus.setArea(resultSet.getString("area"));
				virus.setInfotype(resultSet.getString("infotype"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  virus;
	}

	@Override
	public List<Personline> loads_P() {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from road;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Personline> personlines = new ArrayList<Personline>();
		Personline personline = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				personline = new Personline();
				personline.setConfid(resultSet.getString("confid"));
				personline .setProvince(resultSet.getString("province"));
				personline.setCity(resultSet.getString("city"));
				personline.setCounty(resultSet.getString("county"));
				personline.setUser_num(resultSet.getString("user_num"));
				personline.setUser_name(resultSet.getString("user_name"));
				personline.setOther_info(resultSet.getString("other_info"));
				personline.setContent(resultSet.getString("content"));
				personline.setTarget(resultSet.getString("target"));
				personline.setPub_time(resultSet.getString("pub_time"));
				personline.setSource(resultSet.getString("source"));
				personline.setSource_url(resultSet.getString("source_url"));
				personline.setContact(resultSet.getString("contact"));
				
				personline.setContact_detail(resultSet.getString("contact_detail"));
				personline.setTarget(resultSet.getString("target"));
				personline.setLasttime(resultSet.getString("lasttime"));
				personlines.add(personline);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  personlines;
	}

	@Override
	public List<Personline> load(String data) {
		String datas[]={};
		
		Connection connection = DBUtil.getConnection();
		String sql = "";
		if(data.contentEquals("-6-")) {
			sql = "select * from road;";
		}
		else {
			datas=data.split("-");
			if(datas[0].contentEquals(datas[1])) {
			sql="select * from road where province=\'"+datas[1]+"\' and city= \'"+datas[2]+"\'";
			}else {
				sql="select * from road where province= \'"+datas[0]+"\' and city=\'"+datas[1]+"\' and county =\'"+datas[2]+"\'";
			}
		}
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Personline> personlines = new ArrayList<Personline>();
		Personline personline = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				personline = new Personline();
				personline.setConfid(resultSet.getString("confid"));
				personline .setProvince(resultSet.getString("province"));
				personline.setCity(resultSet.getString("city"));
				personline.setCounty(resultSet.getString("county"));
				personline.setUser_num(resultSet.getString("user_num"));
				personline.setUser_name(resultSet.getString("user_name"));
				personline.setOther_info(resultSet.getString("other_info"));
				personline.setContent(resultSet.getString("content"));
				personline.setTarget(resultSet.getString("target"));
				personline.setPub_time(resultSet.getString("pub_time"));
				personline.setSource(resultSet.getString("source"));
				personline.setSource_url(resultSet.getString("source_url"));
				personline.setContact(resultSet.getString("contact"));
				
				personline.setContact_detail(resultSet.getString("contact_detail"));
				personline.setTarget(resultSet.getString("target"));
				personline.setLasttime(resultSet.getString("lasttime"));
				personlines.add(personline);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  personlines;
	}

	@Override
	public Simpledata load_SD(String date) {
		Connection connection = DBUtil.getConnection();
		date="2020-03-12";
		String sql = "select * from n_simpledata where lastUpdateTime like "+"\'"+date+"%\'";
		PreparedStatement preparedStatement = null;
		
		ResultSet resultSet = null;
		/*List<Simpledata> simpledatas = new ArrayList<Simpledata>();*/
		Simpledata simpledata=new Simpledata();
		try {
			preparedStatement = connection.prepareStatement(sql);
		
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				simpledata = new Simpledata();
				simpledata.setLastUpdateTime(resultSet.getString("lastUpdateTime"));
				simpledata.setConfirm(resultSet.getString("confirm"));
				simpledata.setSuspect(resultSet.getString("suspect"));
				simpledata.setDead(resultSet.getString("dead"));
				simpledata.setHeal(resultSet.getString("heal"));
				simpledata.setAdd_confirm(resultSet.getString("add_confirm"));
				simpledata.setAdd_suspect(resultSet.getString("add_suspect"));
				simpledata.setAdd_dead(resultSet.getString("add_dead"));
				simpledata.setAdd_heal(resultSet.getString("add_heal"));
				/*simpledatas.add(simpledata);*/
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  simpledata;
	}

	@Override
	public List<Text_data> load_T() {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from text_data;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Text_data> text_datas = new ArrayList<Text_data>();
		Text_data text_data = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				text_data = new Text_data();
				text_data.setCmsId(resultSet.getString("cmsId"));
				text_data.setSource(resultSet.getString("source"));
				text_data.setMedia(resultSet.getString("media"));
				text_data.setPublish_time(resultSet.getString("publish_time"));
				text_data.setCan_use(resultSet.getString("can_use"));
				text_data.setC_desc(resultSet.getString("c_desc"));
				text_data.setUrl(resultSet.getString("url"));
				text_data.setTitle(resultSet.getString("title"));
				text_datas.add(text_data);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  text_datas;
	}

	@Override
	public List<Line> load_L() {
	Connection connection = DBUtil.getConnection();
		
		String sql = "select * from line;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Line> lines = new ArrayList<Line>();
		Line line = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				line = new Line();
				line.setId(resultSet.getString("id"));
				line.setT_date(resultSet.getString("t_date"));
				line.setT_start(resultSet.getString("t_start"));
				line.setT_end(resultSet.getString("t_end"));
				line.setT_type(resultSet.getString("t_type"));
				line.setT_no(resultSet.getString("t_no"));
				line.setT_memo(resultSet.getString("t_memo"));
				line.setT_no_sub(resultSet.getString("t_no_sub"));
				line.setT_pos_start(resultSet.getString("t_pos_start"));
				line.setT_pos_end(resultSet.getString("t_pos_end"));
				line.setSource(resultSet.getString("source"));
				line.setWho(resultSet.getString("who"));
				line.setVerified(resultSet.getString("verified"));
				line.setCreated_at(resultSet.getString("created_at"));
				line.setUpdated_at(resultSet.getString("updated_at"));
				
				lines.add(line);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  lines;
	}

	@Override
	public List<Line> load_NL() {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from newline;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Line> lines = new ArrayList<Line>();
		Line line = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				line = new Line();
				line.setT_date(resultSet.getString("t_date"));
				line.setT_start(resultSet.getString("t_start"));
				line.setT_end(resultSet.getString("t_end"));
				line.setT_type(resultSet.getString("t_type"));
				line.setT_no(resultSet.getString("t_no"));
				line.setT_memo(resultSet.getString("t_memo"));
				line.setT_no_sub(resultSet.getString("t_no_sub"));
				line.setT_pos_start(resultSet.getString("t_pos_start"));
				line.setT_pos_end(resultSet.getString("t_pos_end"));
				line.setSource(resultSet.getString("source"));
				line.setWho(resultSet.getString("who"));
				
				lines.add(line);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  lines;
	}

	@Override
	public List<Line> load_NL2(String content) {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from newline ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Line> lines = new ArrayList<Line>();
		Line line = null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where t_date like ? or t_no like ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+content+"%");
				preparedStatement.setString(2, "%"+content+"%");
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				line = new Line();
				line.setT_date(resultSet.getString("t_date"));
				line.setT_start(resultSet.getString("t_start"));
				line.setT_end(resultSet.getString("t_end"));
				line.setT_type(resultSet.getString("t_type"));
				line.setT_no(resultSet.getString("t_no"));
				line.setT_memo(resultSet.getString("t_memo"));
				line.setT_no_sub(resultSet.getString("t_no_sub"));
				line.setT_pos_start(resultSet.getString("t_pos_start"));
				line.setT_pos_end(resultSet.getString("t_pos_end"));
				line.setSource(resultSet.getString("source"));
				line.setWho(resultSet.getString("who"));
				lines.add(line);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  lines;
	}

	@Override
	public List<N_data> load_ND() {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from n_data where d_type=\'1\' ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<N_data> n_datas = new ArrayList<N_data>();
		N_data n_data = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				n_data = new N_data();
				n_data.setD_type(resultSet.getString("d_type"));
				n_data.setLastUpdateTime(resultSet.getString("lastUpdateTime"));
				n_data.setConfirm(resultSet.getString("confirm"));
				n_data.setSuspect(resultSet.getString("suspect"));
				n_data.setDead(resultSet.getString("dead"));
				n_data.setHeal(resultSet.getString("heal"));
				n_data.setDeadRate(resultSet.getString("deadRate"));
				n_data.setHealRate(resultSet.getString("healRate"));
				
				n_datas.add(n_data);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  n_datas;
	}

	@Override
	public List<N_data> load_ND2() {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from n_data where d_type=\'0\' ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<N_data> n_datas = new ArrayList<N_data>();
		N_data n_data = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				n_data = new N_data();
				n_data.setD_type(resultSet.getString("d_type"));
				n_data.setLastUpdateTime(resultSet.getString("lastUpdateTime"));
				n_data.setConfirm(resultSet.getString("confirm"));
				n_data.setSuspect(resultSet.getString("suspect"));
				n_data.setDead(resultSet.getString("dead"));
				n_data.setHeal(resultSet.getString("heal"));
				n_data.setDeadRate(resultSet.getString("deadRate"));
				n_data.setHealRate(resultSet.getString("healRate"));
				
				n_datas.add(n_data);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  n_datas;
	}

	@Override
	public List<C_data> load_NC() {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from compare_data  ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<C_data> c_datas = new ArrayList<C_data>();
		C_data c_data = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				c_data = new C_data();
				c_data.setD_date(resultSet.getString("d_date"));
				c_data.setHubei(resultSet.getString("hubei"));
				c_data.setCountry(resultSet.getString("country"));
				c_data.setNohubei(resultSet.getString("nohubei"));
				
				c_datas.add(c_data);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  c_datas;
	}

	@Override
	public List<NH_data> load_NH() {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from newhistory_dc_data2  ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<NH_data> nh_datas = new ArrayList<NH_data>();
		NH_data nh_data = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				nh_data = new NH_data();
				nh_data.setD_date(resultSet.getString("d_date"));
				nh_data.setDead_countryRate(resultSet.getString("dead_countryRate"));
				nh_data.setDead_hubeiRate(resultSet.getString("dead_hubeiRate"));
				nh_data.setDead_notHubeiRate(resultSet.getString("dead_notHubeiRate"));
				nh_data.setHeal_countryRate(resultSet.getString("heal_countryRate"));
				nh_data.setHeal_hubeiRate(resultSet.getString("heal_hubeiRate"));
				nh_data.setHeal_notHubeiRate(resultSet.getString("heal_notHubeiRate"));
				nh_datas.add(nh_data);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  nh_datas;
	}

	@Override
	public List<All_data> load_all(String infotype) {
Connection connection = DBUtil.getConnection();
		
		String sql = "select * from all_data where  infotype = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<All_data> all_datas = new ArrayList<All_data>();
		All_data all_data = new All_data();
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,infotype);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				all_data = new All_data();
				all_data.setConfirm(resultSet.getString("all_confirm"));
				all_data.setAll_suspect(resultSet.getString("all_suspect"));
				all_data.setAll_heal(resultSet.getString("all_heal"));
				all_data.setAll_dead(resultSet.getString("all_dead"));
				all_data.setT_confirm(resultSet.getString("t_confirm"));
				all_data.setAll_deadRate(resultSet.getString("all_deadRate"));
				all_data.setAll_healRate(resultSet.getString("all_healRate"));
				all_data.setCountry(resultSet.getString("country"));
				all_data.setProvince(resultSet.getString("province"));
				all_data.setArea(resultSet.getString("area"));
				all_data.setInfotype(resultSet.getString("infotype"));
				all_datas.add(all_data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  all_datas;
	}

	@Override
	public List<All_data> load_all2(String province) {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from all_data where  infotype = \'area\' and province = ?;";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<All_data> all_datas = new ArrayList<All_data>();
		All_data all_data = new All_data();
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,province);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				all_data = new All_data();
				all_data.setConfirm(resultSet.getString("all_confirm"));
				all_data.setAll_suspect(resultSet.getString("all_suspect"));
				all_data.setAll_heal(resultSet.getString("all_heal"));
				all_data.setAll_dead(resultSet.getString("all_dead"));
				all_data.setT_confirm(resultSet.getString("t_confirm"));
				all_data.setAll_deadRate(resultSet.getString("all_deadRate"));
				all_data.setAll_healRate(resultSet.getString("all_healRate"));
				all_data.setCountry(resultSet.getString("country"));
				all_data.setProvince(resultSet.getString("province"));
				all_data.setArea(resultSet.getString("area"));
				all_data.setInfotype(resultSet.getString("infotype"));
				all_datas.add(all_data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  all_datas;
	}


}
