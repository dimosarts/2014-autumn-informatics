#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <conio.h>
#include <cmath>
#include <windows.h>
#include <gl/Gl.h>
#include "gl/glext.h"
#include <gl/Glu.h>
#include <gl/glut.h>
#include <gl/glaux.h>
#pragma comment(lib, "opengl32.lib")
#pragma comment(lib, "glu32.lib")
#pragma comment(lib, "glaux.lib")
#pragma comment(lib, "glut32.lib")

using namespace std;

// Пользовательские переменные
GLuint texture[2];

float Width = 1200.0;
float Height = 900.0;

int dx[] = { -1, 1, -1, 1, 0, 0, -1, 1, 0 };
int dy[] = { -1, -1, 1, 1, -1, 1, 0, 0, 0 };

int mas1[45][45];

vector < pair < int, int > > line;

int coord_x = 0;
int coord_y = 0;//положение мышки

int x = 210;
int y = 250;//координаты шарика
int k = 0;//показатель направления
int ax = 0, ay = 0;//курсор
int a = 0;
int ab[9] = { 0, 0, 0, 0, 0, 0, 0, 0, 0 };
int z = 0;
int z1 = 1;

int r = 20;//отступ

int zx[] = { 0, 0, r, -r };
int zy[] = { r, -r, 0, 0 };

int t = 7;//регулирует скорость
int pusk = 0;//пуск/пауза

void drawCircle(float x, float y, float r, int amountSegments) {
	glColor3f(0.3, 0.3, 0.3);
	glBegin(GL_LINE_LOOP);
	for (int i = 0; i < amountSegments; i++)
	{
		float angle = 2.0 * 3.1415926 * float(i) / float(amountSegments);
		float dx = r * cosf(angle);
		float dy = r * sinf(angle);
		glVertex2f(x + dx, y + dy);
	}
	glEnd();
}

void polygon(int a, int b, int c, int d) {
	glBegin(GL_POLYGON);
	glVertex2f(a, c);
	glVertex2f(b, c);
	glVertex2f(b, d);
	glVertex2f(a, d);
	glEnd();
}

void cursor_move() {
	if (mas1[ay / 20][ax / 20] == -2)
	{
		for (int i = 0; i < line.size(); i++)
		{
			mas1[line[i].second / 20][line[i].first / 20] = -2;
		}
		line.clear();
	}
	line.push_back(make_pair(ax, ay));
	/*mas1[ay / 20][ax / 20] = 1;*/
}

void LoadTextures() {
	AUX_RGBImageRec *texture1 = auxDIBImageLoadA("run.bmp");
	AUX_RGBImageRec *texture2 = auxDIBImageLoadA("new.bmp");
	glGenTextures(4, &texture[0]);
	glBindTexture(GL_TEXTURE_2D, texture[0]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture1->sizeX, texture1->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture1->data);
	glBindTexture(GL_TEXTURE_2D, texture[1]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture2->sizeX, texture2->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture2->data);
}

void Display()
{
	glClear(GL_COLOR_BUFFER_BIT);
	glPushMatrix();
	glColor3f(1.0, 1.0, 1.0);
	glBindTexture(GL_TEXTURE_2D, 0);
	glColor3f(0.3, 0.3, 0.3);
	polygon(Height, Width, 0, Height);//правая часть экрана
	glColor3f(0.3, 0.5, 0.7);//--------------------------рамка----------------------------
	for (int i = 0; i < 45; i++)
		for (int j = 0; j < 45; j++)
			if (mas1[i][j] == -2)
				polygon(j * 20, j * 20 + r, i * 20, i * 20 + r);
	//-------------------------------------------------------------------------------------
	glColor3f(0.5, 0.0, 0.5);
	for (int i = 0; i < line.size(); i++)
	{
		polygon(line[i].first, line[i].first + r, line[i].second, line[i].second + r);//курсор
		if (x / r == line[i].first / r && y / r == line[i].second / r && line.size() > 1)//-----delete line--------------------
		{
			for (int j = 1; j < line.size(); j++)
				mas1[line[j].second / 20][line[j].first / 20] = 0;
			line.clear();
			line.push_back(make_pair(0, 0));
			ax = 0;
			ay = 0;
		}//-------------------------------------------------------------------------------------
	}
	glColor3f(1.0, 1.0, 1.0);
	if (pusk)
		glBindTexture(GL_TEXTURE_2D, texture[0]);
	else
		glBindTexture(GL_TEXTURE_2D, texture[1]);
	glBegin(GL_POLYGON);//----------------------------------------------------------------
	glTexCoord2f(0.0, 1.0); glVertex2f(Height + 60, 100);
	glTexCoord2f(1.0, 1.0); glVertex2f(Width - 60, 100);
	glTexCoord2f(1.0, 0.0); glVertex2f(Width - 60, 160);
	glTexCoord2f(0.0, 0.0); glVertex2f(Height + 60, 160);
	glEnd();//-------------------------------------------пуск-----------------------------
	glBindTexture(GL_TEXTURE_2D, 0);
	/*drawCircle(x, y, r - 10, 30);*/
	glColor3f(1.0, 0.0, 0.0);
	glPointSize(58.0);
	glEnable(GL_POINT_SMOOTH);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glBegin(GL_POINTS);
	glVertex3f(x, y, 0.0);//шарик
	glEnd();
	if (!pusk)
	{
		if (line[line.size() - 1].first != ax || line[line.size() - 1].second != ay)
			cursor_move();
		glBegin(GL_POINTS);
		for (int i = 0; i < 1; i++)
		{
			x += dx[k];
			y += dy[k];
			Sleep(t);
			glVertex3f(x, y, 0.0);//шарик
		}
		glEnd();
		if (y % 20 == 10 && x % 20 == 10)
		{
			//-------------------------------------alternative--------------------------------

			if (ax + zx[z] >= 0 && ax + zx[z] < 900 && ay + zy[z] >= 0 && ay + zy[z] < 900 && mas1[ay / 20][ax / 20] == 0)
			{
				if (line[line.size() - 1].first != ax || line[line.size() - 1].second != ay)
					cursor_move();
				ax += zx[z];
				ay += zy[z];
			}
			a = 0;
			for (int i = 0; i < 8; i++)
			{
				if (mas1[y / 20 + dy[i]][x / 20 + dx[i]] == -2)
				{
					ab[i] = 0;
					a++;
				}
				else
				{
					ab[i] = 1;
				}
			}
			if (!ab[6] && !ab[4] && !ab[7] && !ab[5])
				k = 8;
			else if (!ab[6] && !ab[7])
			{
				if (!ab[4])
					k = 5;
				else if (!ab[5])
					k = 4;
			}
			else if (!ab[4] && !ab[5])
			{
				if (!ab[7])
					k = 6;
				else if (!ab[6])
					k = 7;
			}
			else if ((!ab[6] && !ab[4]) || (!ab[0] && ab[6] && ab[4]))
				k = 3;
			else if ((!ab[5] && !ab[7]) || (!ab[3] && ab[5] && ab[7]))
				k = 0;
			else if ((!ab[4] && !ab[7]) || (!ab[1] && ab[4] && ab[7]))
				k = 2;
			else if ((!ab[6] && !ab[5]) || (!ab[2] && ab[6] && ab[5]))
				k = 1;
			else if (!ab[6])
				k++;
			else if (!ab[7])
				k--;
			else if (!ab[4])
				k += 2;
			else if (!ab[5])
				k -= 2;
			//---------------------------------------------------------------------------------
		}
	}
	glPopMatrix();
	glFinish();
	glutSwapBuffers();
	glutPostRedisplay();
}

void Initialize() {
	glEnable(GL_TEXTURE_2D);
	LoadTextures();
	glClearColor(1.0, 1.0, 1.0, 1.0);
	glMatrixMode(GL_PROJECTION);
	glDisable(GL_DEPTH_TEST);
	glLoadIdentity();
	gluOrtho2D(0.0, (GLdouble)Width, (GLdouble)Height, 0.0);
	glMatrixMode(GL_MODELVIEW);
	for (int i = 0; i < 45; i++)
		for (int j = 0; j < 45; j++)
			mas1[i][j] = 0;
	for (int i = 0; i < 45; i++)
	{
		mas1[0][i] = -2;
		mas1[44][i] = -2;
		mas1[i][0] = -2;
		mas1[i][44] = -2;
	}
	line.push_back(make_pair(0, 0));
}

void mouseMove(int x, int y) {
	coord_x = x;
	coord_y = y;
}

void mouseButton(int button, int state, int x, int y)
{
	if (button == GLUT_LEFT_BUTTON) {
		if (state == GLUT_DOWN) {
			coord_x = x;
			coord_y = y;
		}
		else
		{
			coord_x = x;
			coord_y = y;

			//-------------------------------------- пуск -----------------------------------

			if (coord_x >= Height + 60 && coord_x <= Width - 60 && coord_y >= 100 && coord_y <= 160)
			{
				pusk = (pusk + 1) % 2;
			}

			//----------------------------------- конец/пуск --------------------------------

		}
	}
}

void Keyboard(unsigned char key, int x, int y) {
	if (key == 27)
		exit(0);
}

void specialKeys(int key, int x, int y) {
	switch (key) {
	case GLUT_KEY_LEFT:
		if(ax && (z != 2 || mas1[ay / 20][ax / 20] == -2)) z = 3; break;
	case GLUT_KEY_RIGHT:
		if (ax < 880 && (z != 3 || mas1[ay / 20][ax / 20] == -2)) z = 2; break;
	case GLUT_KEY_UP:
		if (ay && (z != 0 || mas1[ay / 20][ax / 20] == -2)) z = 1; break;
	case GLUT_KEY_DOWN:
		if (ay < 880 && (z != 1 || mas1[ay / 20][ax / 20] == -2)) z = 0; break;
	}
	if (ax + zx[z] >= 0 && ax + zx[z] < 900 && ay + zy[z] >= 0 && ay + zy[z] < 900 && mas1[ay / 20][ax / 20] == -2)
	{
		ax += zx[z];
		ay += zy[z];
		cursor_move();
	}
}

int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(Width, Height);
	glutInitWindowPosition(250, 50);
	glutCreateWindow("Ball");
	glutDisplayFunc(Display);
	Initialize();
	glutMouseFunc(mouseButton);
	glutMotionFunc(mouseMove);
	glutKeyboardFunc(Keyboard);
	glutSpecialFunc(specialKeys);
	glutMainLoop();
}