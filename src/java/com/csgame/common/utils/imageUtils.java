package com.csgame.common.utils;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.util.List;

import javax.swing.ImageIcon;

public class imageUtils {

	// 给jpg添加文字
	public static BufferedImage createStringMark(String filePath, float qualNum,List<ImageDraw> drawList) {
		ImageIcon imgIcon = new ImageIcon(filePath);
		Image theImg = imgIcon.getImage();
		int width = theImg.getWidth(null) == -1 ? 200 : theImg.getWidth(null);
		int height = theImg.getHeight(null) == -1 ? 200 : theImg.getHeight(null);
		BufferedImage bimage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bimage.createGraphics();
		g.drawImage(theImg, 0, 0, null);
		for (ImageDraw imageDraw:drawList) {
			g.setColor(imageDraw.getMarkContentColor());
			g.setBackground(Color.red);
			g.setFont(new Font(null, Font.BOLD, 15)); // 字体、字型、字号
			g.drawString(imageDraw.getMarkContent(), imageDraw.getX(), imageDraw.getY()); // 画文字
		}
		g.dispose();
		return bimage;
	}
}
