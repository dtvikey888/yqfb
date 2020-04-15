package org.fjw.weixin.util;

/**
 * JAVA 返回随机数，并根据概率、比率
 * @author fjw
 * 做一个翻宝程序，通过返回数字0-5来判断中奖情况，
01234，这几个数字的出现的概率是4出现最高，3出现比4少，2出现比3少，依次下去
 *
 */
public class MathRandom6
{



 /**
  * 5出现的概率为%20
  */
 public static double rate0 = 0.2;
 /**
  * 4出现的概率为%58
  */
 public static double rate1 = 0.58;
 /**
  * 3出现的概率为%10
  */
 public static double rate2 = 0.1;
 /**
  * 2出现的概率为%10
  */
 public static double rate3 = 0.1;
 /**
  * 1出现的概率为%2
  */
 public static double rate4 = 0.02;

 /**
  * 0出现的概率为%0
  */
 public static double rate5 = 0.0;






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

  if (randomNumber >= 0 && randomNumber <= rate0 )
  {
   return 5;
  }
  else if (randomNumber >= rate0/100 && randomNumber <= rate0 + rate1)
  {
   return 4;
  }
  else if (randomNumber >= rate0 + rate1 && randomNumber <= rate0 + rate1 + rate2)
  {
   return 3;
  }
  else if (randomNumber >= rate0 + rate1 +rate2 && randomNumber <= rate0 + rate1 + rate2 + rate3)
  {
   return 2;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3   && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4)
  {
   return 1;
  }
  else if (randomNumber >= rate0 + rate1 + rate2 + rate3 + rate4
          && randomNumber <= rate0 + rate1 + rate2 + rate3 + rate4+ rate5)
  {
   return 0;
  }
  return 5;
 }

 /**
  * 测试主程序
  * @param agrs
  */
 public static void main(String[] agrs)
 {
  int i = 0;
  MathRandom6 a = new MathRandom6();
  for (i = 0; i <=100; i++)//打印100个测试概率的准确性
  {
   System.out.print(a.PercentageRandom()+",");
  }
 }
}
