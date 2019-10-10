package org.fjw.weixin.util;

/**
 * JAVA 返回随机数，并根据概率、比率
 * @author fjw
 * 做一个翻宝程序，通过返回数字0-5来判断中奖情况，
01234，这几个数字的出现的概率是4出现最高，3出现比4少，2出现比3少，依次下去
 *
 */
public class MathRandom5
{



 /**
  * 4出现的概率为%50
  */
 public static double rate0 = 0.05;
 /**
  * 3出现的概率为%20
  */
 public static double rate1 = 0.05;
 /**
  * 2出现的概率为%15
  */
 public static double rate2 = 0.05;
 /**
  * 1出现的概率为%10
  */
 public static double rate3 = 0.05;
 /**
  * 0出现的概率为%4
  */
 public static double rate4 = 0.05;

 /**
  * 3出现的概率为%20
  */
 public static double rate5 = 0.05;

 /**
  * 3出现的概率为%20
  */
 public static double rate6 = 0.1;


 /**
  * 3出现的概率为%20
  */
 public static double rate7 = 0.1;

 /**
  * 3出现的概率为%20
  */
 public static double rate8 = 0.1;

 /**
  * 3出现的概率为%20
  */
 public static double rate9 = 0.1;

 /**
  * 3出现的概率为%20
  */
 public static double rate10 = 0.1;

 /**
  * 3出现的概率为%20
  */
 public static double rate11 = 0.1;

 /**
  * 3出现的概率为%20
  */
 public static double rate12 = 0.1;



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
   return 12;
  }
  else if (randomNumber >= rate0/100 && randomNumber <= rate0 + rate1)
  {
   return 11;
  }
  else if (randomNumber >= rate0 + rate1 && randomNumber <= rate0 + rate1 + rate2)
  {
   return 10;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 && randomNumber <= rate0 + rate1 + rate2 + rate3)
  {
   return 9;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3 && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4)
  {
   return 8;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3+ rate4 && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5)
  {
   return 7;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3+ rate4+ rate5 && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6)
  {
   return 6;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3+ rate4+ rate5+ rate6 && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7)
  {
   return 5;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3+ rate4+ rate5+ rate6+ rate7 && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8)
  {
   return 4;
  }
  else if (randomNumber >= rate0 + rate1+ rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8
          && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8+ rate9)
  {
   return 3;
  }
  else if (randomNumber >= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8+ rate9
          && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8+ rate9+ rate10)
  {
   return 2;
  }
  else if (randomNumber >= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8+ rate9 + rate10
          && randomNumber <= rate0 + rate1 + rate2 + rate3+ rate4+ rate5+ rate6+ rate7+ rate8+ rate9+ rate10+ rate11)
  {
   return 1;
  }
  else if (randomNumber >= rate0 + rate1 + rate2 + rate3 + rate4+ rate5+ rate6+ rate7+ rate8+ rate9+ rate10+ rate11
          && randomNumber <= rate0 + rate1 + rate2 + rate3 + rate4+ rate5+ rate6+ rate7+ rate8+ rate9+ rate10+ rate11+ rate12)
  {
   return 0;
  }
  return 12;
 }

 /**
  * 测试主程序
  * @param agrs
  */
 public static void main(String[] agrs)
 {
  int i = 0;
  MathRandom5 a = new MathRandom5();
  for (i = 0; i <=100; i++)//打印100个测试概率的准确性
  {
   System.out.print(a.PercentageRandom()+",");
  }
 }
}
