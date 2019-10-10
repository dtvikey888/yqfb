package com.fjw.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
//import javax.script.ScriptEngine;
//import javax.script.ScriptEngineManager;
//import javax.script.ScriptException;
//import sun.org.mozilla.javascript.internal.NativeArray;
//import sun.org.mozilla.javascript.internal.NativeObject;

public class Tester
{
    /**
     public static void main ( String[] args )
     {
     ScriptEngineManager sem = new ScriptEngineManager ();
     ScriptEngine se = sem.getEngineByName ("js");
     String jsonstr = "{\"data\":{\"a\":[{\"b1\":\"bb1\",\"c1\":\"cc1\"},{\"b2\":\"bb2\",\"c2\":\"cc2\"}]}}";
     try
     {
     NativeObject no = (NativeObject) se.eval ("(" + jsonstr + ")");
     NativeObject data = (NativeObject) no.get ("data");
     NativeArray na = (NativeArray) data.get ("a");
     for ( int i = 0; i < na.getLength (); i++ )
     {
     NativeObject object = (NativeObject) na.get (i);
     Object[] ids = object.getIds ();
     for ( int j = 0; j < ids.length; j++ )
     {
     System.out.println (object.get (ids[j].toString ()));
     }
     }
     }
     catch (ScriptException e)
     {
     e.printStackTrace ();
     }
     }
     **/
}