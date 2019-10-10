package org.liufeng.course.util;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import net.coobird.thumbnailator.geometry.Positions;

import org.junit.Test;


public class ThumbTest {
	
	@Test
	public void testHandlePicture() throws IOException{
		
		//����ͼƬ�ļ�(�˴�Ϊ1024��768px��ͼƬ)�ʹ�����ͼƬ�ļ�
		File fromPic=new File("picture/����ͼƬ1024px-768px.jpg");
		File toPic=new File("picture/���ͼƬ.jpg");
		File waterPic=new File("picture/ˮӡͼƬ.jpg");//��Ϊˮӡ��ͼƬ
		
		
		//��ָ����С��ͼƬ�������ͷţ�����ѭԭͼ�߿������ 
		//�˴���ͼƬѹ��400��500������ͼ
		Thumbnails.of(fromPic).size(400,500).toFile(toPic);//��Ϊ400*300,��ѭԭͼ��������ŵ�400*ĳ���߶�
		
		
		//���ձ���������С�ͷŴ�
		Thumbnails.of(fromPic).scale(0.2f).toFile(toPic);//��������С
		Thumbnails.of(fromPic).scale(2f);//�������Ŵ�
		
		
		//�����������Ͱ�ָ���Ĵ�С��������
		Thumbnails.of(fromPic).size(100, 100).keepAspectRatio(false).toFile(toPic);
		//����Thumbnails.of(fromPic).forceSize(100,100).toFile(toPic);
		
		//��תͼƬ��rotate(�Ƕ�),������Ϊ˳ʱ�룬������Ϊ��ʱ��
		Thumbnails.of(fromPic).size(200,200).rotate(90).toFile(toPic);
		
		//ͼƬ�ߴ粻�䣬ѹ��ͼƬ�ļ���СoutputQualityʵ��,����1Ϊ�������
		Thumbnails.of(fromPic).scale(1f).outputQuality(0.25f).toFile(toPic);
		
		//��ͼƬ��ˮӡ��watermark(λ�ã�ˮӡͼ��͸����)Positions.CENTER��ʾ�����м�
		Thumbnails.of(fromPic).size(400,400)
		.watermark(Positions.CENTER,ImageIO.read(waterPic),0.5f)
		.outputQuality(0.8f).toFile(toPic);
		
		//��sourceRegion()ʵ��ͼƬ�ü�
		//ͼƬ����300*300������,Positions.CENTER��ʾ���ģ������������λ�ÿ�ѡ
		Thumbnails.of(fromPic).sourceRegion(Positions.CENTER,300,300)
		.size(300,300).toFile(toPic);
		
		
		//ͼƬ��������300*300������
		Thumbnails.of(fromPic).sourceRegion(Positions.TOP_CENTER,300,300)
			.size(300,300).toFile(toPic);
		
		
		Thumbnails.of(fromPic).sourceRegion(0,0,200,200)
		.size(300,300).toFile(toPic);
		
		//��outputFormat(ͼ���ʽ)ת��ͼƬ��ʽ������ԭ�ߴ粻��
		Thumbnails.of(fromPic).scale(1f).outputFormat("png")
		.toFile("picture/png��ʽ��ͼƬ.png");
		
		//������ļ���OutputStream
		OutputStream os=new FileOutputStream(toPic);
		Thumbnails.of(fromPic).size(120,120).toOutputStream(os);
		
		//���BufferedImage,asBufferedImage()����BufferedImage
		BufferedImage bi=Thumbnails.of(fromPic).size(120,120).asBufferedImage();
		ImageIO.write(bi,"jpg",toPic);
		
		//ѹ����ָ��ͼƬ�ߴ磨���磺��400��300��������ͼƬ�����Σ����ಿ�ֲü���(������������ѵĴ���)
		BufferedImage image = ImageIO.read(fromPic);
		Builder<BufferedImage> builder = null;

		int imageWidth = image.getWidth();
		int imageHeitht = image.getHeight();
		if ((float)300 / 400 != (float)imageWidth / imageHeitht) {
			if (imageWidth > imageHeitht) {
				image = Thumbnails.of(fromPic).height(300).asBufferedImage();
			} else {
				image = Thumbnails.of(fromPic).width(400).asBufferedImage();
			}
			builder = Thumbnails.of(image).sourceRegion(Positions.CENTER, 400, 300).size(400, 300);
		} else {
			builder = Thumbnails.of(image).size(400, 300);
		}
		builder.outputFormat("jpg").toFile(toPic);
		
		
	}
	
	
	
	public void testHandlePicture2(String fromPicName,String toPicName) throws IOException{
		
		//����ͼƬ�ļ�(�˴�Ϊ1024��768px��ͼƬ)�ʹ�����ͼƬ�ļ�
		File fromPic=new File(fromPicName);
		File toPic=new File(toPicName);

		
		//ͼƬ�ߴ粻�䣬ѹ��ͼƬ�ļ���СoutputQualityʵ��,����1Ϊ�������
		//Thumbnails.of(fromPic).scale(1f).outputQuality(0.25f).toFile(toPic);
		
		//�˴���ͼƬѹ��400��500������ͼ
		Thumbnails.of(fromPic).size(400,500).toFile(toPic);//��Ϊ400*300,��ѭԭͼ��������ŵ�400*ĳ���߶�
		
		
	}
	
	
    public void testHandlePicture3(String fromPicName,String toPicName) throws IOException{
		
		//����ͼƬ�ļ�(�˴�Ϊ1024��768px��ͼƬ)�ʹ�����ͼƬ�ļ�
		//File fromPic=new File(fromPicName);
		File toPic=new File(toPicName);

		
		//ͼƬ�ߴ粻�䣬ѹ��ͼƬ�ļ���СoutputQualityʵ��,����1Ϊ�������
		//Thumbnails.of(fromPic).scale(1f).outputQuality(0.25f).toFile(toPic);
		
		//�˴���ͼƬѹ��400��500������ͼ
		Thumbnails.of(fromPicName).size(400,500).toFile(toPic);//��Ϊ400*300,��ѭԭͼ��������ŵ�400*ĳ���߶�
		
		
	}
	
}
		
		
		
		