package org.fjw.weixin.util;


/**
 * JAVA 返回随机数，并根据概率、比率
 * @author fjw
 * 做一个翻宝程序，通过返回数字0-5来判断中奖情况，
012，这几个数字的出现的概率是2出现最高，1出现比2少，0出现比1少，依次下去
 *
 */
public class MathRandom4
{
 /**
  * 3出现的概率为%50
  */
 public static double rate0 = 0.50;
 /**
  * 2出现的概率为%20
  */
 public static double rate1 = 0.20;
 /**
  * 1出现的概率为%20
  */
 public static double rate2 = 0.20;

 /**
  * 0出现的概率为%10
  */
 public static double rate3 = 0.10;

 /**
  * Math.random()产生一个double型的随机数，判断一下
  * 例如4出现的概率为%50，则介于0到0.50中间的返回4
  * @return int
  *
  */
 public int PercentageRandom()
 {
  double randomNumber;
  randomNumber = Math.random();
  if (randomNumber >= 0 && randomNumber <= rate0)
  {
   return 3;
  }
  else if (randomNumber >= rate0 / 100 && randomNumber <= rate0 + rate1)
  {
   return 2;
  }
  else if (randomNumber >= rate0 + rate1
          && randomNumber <= rate0 + rate1 + rate2)
  {
   return 1;
  }
  else if (randomNumber >= rate0 + rate1 + rate2
          && randomNumber <= rate0 + rate1 + rate2 + rate3)
  {
   return 0;
  }

  return 3;
 }

 /**
  * 测试主程序
  * @param agrs
  */
 public static void main(String[] agrs)
 {
  int i = 0;
  MathRandom4 a = new MathRandom4();
  for (i = 0; i <=100; i++)//打印100个测试概率的准确性
  {
   System.out.print(a.PercentageRandom());
  }
 }
}
