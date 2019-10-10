package org.fjw.weixin.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class PublicFun {

	private String resultss = "";

	public String getResultss() {
		return resultss;
	}

	public void setResultss(String resultss) {
		this.resultss = resultss;
	}

	/**
	 *
	 * @param s
	 * @return 切割 |
	 */
	public String getContent(final String s) {
		String regex;
		String content = "";
		final List<String> list = new ArrayList<String>();
		regex = "|.*?";
		final Pattern pa = Pattern.compile(regex, Pattern.CANON_EQ);
		final Matcher ma = pa.matcher(s);
		while (ma.find()) {
			list.add(ma.group());
		}
		for (int i = 0; i < list.size(); i++) {
			content = content + list.get(i);
		}
		return content;
	}

	public static void main(String[] args) {

//		PublicFun top = new PublicFun();
//
//		String reString;
//
//		String[] count2 = PublicFun.split("http://news.xinhuanet.com/politics/2011-11/07/c_111149436.htm中宣部副部长蔡赴朝：加快构建现代传播体系</a>", ".htm");
//
//		//reString = top.getUrl(count2[0], count2[1], count2[2]);
//
//		//System.out.println("PublicFun.main()： " + reString);
//      System.out.println(count2[0]);
//
//		for (String ddd : count2) {
//			System.out.println(ddd);
//		}

		String dd[] = PublicFun.split("xx/aa/dd", "/");

		System.out.println("length:="+dd.length);
		for (int i = 0; i < dd.length; i++) {
			System.out.println(dd[i]);
		}


	}

	public String getUrl(String aa, String bb, String cc) {
		String reString;

		reString = getYear(aa) + getMonth(bb) + getDay(cc);

		return reString;

	}

	public String getYear(String yString) {
		String yString2;
		yString2 = yString.substring(2, 4);

		return yString2;
	}

	public String getMonth(String mString) {
		String monthString;

		if (new Integer(mString) > 9) {

			monthString = mString;
		} else {
			monthString = "0" + mString;
		}

		return monthString;

	}

	public String getDay(String mString) {
		String DayString;

		if (new Integer(mString) > 9) {

			DayString = mString;
		} else {
			DayString = "0" + mString;
		}

		return DayString;

	}

	public String getPUb2(String dd) throws Exception {
		PublicFun top = new PublicFun();

		List<String> count2 = top.getPUb(dd);

		String reString = "";

		for (int t = 0; t < count2.size(); t++) {
			//System.out.println(t+" "+count2.get(t));
			//System.out.print(count2.get(t));

			reString += count2.get(t);

		}

		top.setResultss(reString);

		return top.getResultss();

	}

	public List<String> getPUb(String dd) throws Exception {

		List<String> Countlist = new ArrayList<String>();

		PublicFun test = new PublicFun();
		String b[] = test.split(dd, "|");
		for (int i = 0; i < b.length; i++) {
			String c[] = test.split(b[i], "/");
			//System.out.println(b[i]);

			String ss = c[3] + "|";

			Countlist.add(ss);

			//test.setResultSS(ss);
			//System.out.print(ss);

		}
		return Countlist;

	}

	public static String[] split(String source, String spliter) {
		int index = 0;
		String tmp = source;
		Vector vArray = new Vector();
		while ((index = tmp.indexOf(spliter)) != -1) {
			vArray.add(tmp.substring(0, index));
			tmp = tmp.substring(index + spliter.length());
		}
		if (tmp.length() > 0)
			vArray.add(tmp);
		String[] b = new String[vArray.size()];
		vArray.toArray(b);
		return b;
	}

	/**
	 * @param urlAdd （url地址,及网页中的动态链接的地址）
	 * @param fileName（生成文件的名称）
	 * @throws uploadDir（生成到服务器端指定的目录）
	 */
	public static void createImage(String urlAdd, String fileName,
								   String uploadDir) throws Exception {

		URL url = new URL(urlAdd);
		Image src = javax.imageio.ImageIO.read(url); // 构造Image对象
		int wideth = src.getWidth(null); // 得到源图宽
		int height = src.getHeight(null); // 得到源图长
		BufferedImage tag = new BufferedImage(wideth, height,
				BufferedImage.TYPE_INT_RGB);
		tag.getGraphics().drawImage(src, 0, 0, wideth, height, null); // 绘制缩小后的图

		FileOutputStream out = new FileOutputStream(uploadDir.concat(fileName)
				.concat(".jpg")); // 输出到文件流
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(tag); // 近JPEG编码
		out.close();
	}
}