import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
public class Fklsg 
{
 public static void main(String[] arge) throws IOException
 {
  String filename = arge[0];
  BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filename),"UTF-8"));
  
  String data = "";
  boolean iffind = false;
  StringBuffer sb = new StringBuffer("");
  System.out.println(filename) ;
  while( (data = br.readLine())!=null)
  {
   data = data.trim();
   
   if(data.equals(".method static constructor <clinit>()V"))
   {
    System.out.println("find 1");
    iffind = true;
   }
   else if(data.indexOf ("return-void") >=0  && iffind)
   {
    System.out.println("append the lib load");
    sb.append(".line 180\n").append("const-string v0, \"substrate\"\n").append("invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n").append("\n");
    sb.append(".line 190\n").append("const-string v0, \"dbpays\"\n").append("invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n").append("\n");
    iffind = false; 
  }
   
   sb.append(data).append("\n");
  } 
  Writer fw = new OutputStreamWriter(new FileOutputStream(new File(filename+"_t"),true), "UTF-8");
  
  fw.write(sb.toString());
  fw.flush();
  fw.close();
  
 }
}
