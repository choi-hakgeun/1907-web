package mongo;

import java.util.List;
import java.util.regex.Pattern;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class MongoMember {
	DB db;
	DBCollection dbc;
	
	public MongoMember() {
		MongoClient client = new MongoDBConn().getClient();
		DB db = client.getDB("m1907");
		  dbc = db.getCollection("member");
	}
	public void insert(String json) {
		
	}
	
	public void modify(String json) {
		
	}
	
	public void delete(String json) {
		
	}
	
	public String view(String json) {
		String rValue = "";
		
		return rValue;
	}
	public List<DBObject> select(String findStr) {
		String rValue="";
		DBCursor cursor = null;
		
		if(findStr == null) {
			cursor = dbc.find();
		}else {
			BasicDBObject filter1 = new BasicDBObject();		
			BasicDBObject filter2 = new BasicDBObject();
			BasicDBList or = new BasicDBList();
			filter1.put("mName", Pattern.compile(findStr));
			filter2.put("mId",   Pattern.compile(findStr));
			
			or.add(filter1);
			or.add(filter2);
			
			BasicDBObject query = new BasicDBObject();
			query.put("$or", or);//{$or : [{filter}, {filter}]}
			cursor = dbc.find(query);			
		}		
				
		return cursor.toArray();
	}
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		String json = null;
		System.out.println(mm.select(""));
		// member collection의 모든 데이터를 조회
		//String json = mm.select(null);
		
		// mId='hong' 인 데이터를 조회
		//json = mm.select("a002");
	}

}
