package com.flight.database;
import java.io.File;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import com.intuit.karate.FileUtils;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class flightdb {
	public static void main(String[] args)  throws UnknownHostException{ 
		 final String dbname = null;
		  final String colname = null;
		create2(dbname, colname);
	}
	public static DBObject create2(String dbname,String colname) throws UnknownHostException
	{
	
        try {
        	
        }
        	catch (Exception e) {
                e.printStackTrace();
            }
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db=mongo.getDB(dbname);
            DBCollection collection = db.getCollection(colname);
        	String jsonString = FileUtils.toString(new File("E://JENKINS_FCM//src//test//java//com//flight//database//response.json"));
            DBObject dbo = (DBObject) com.mongodb.util.JSON.parse(jsonString);
            List<DBObject> list = new ArrayList<>();
            list.add(dbo);
            collection.insert(list);
            System.out.println(list);
            DBObject obj2=selectAllRecordsFromACollection(collection);
            return (DBObject)obj2;
      
    }
	private static DBObject selectAllRecordsFromACollection(DBCollection collection)
	{
		DBObject obj = null;
	    DBCursor cursor = collection.find();
	    while(cursor.hasNext())
	    {
	       
	       obj =cursor.next();
	        System.out.println(obj);
	    }
		return obj;
	}	
}
