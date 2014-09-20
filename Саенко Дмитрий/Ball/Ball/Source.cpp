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
GLuint texture[4];
GLuint pixx[3];


float Width = 1200.0;
float Height = 900.0;

int dx[] = { -1, 1, -1, 1, 0, 0, -1, 1 };
int dy[] = { -1, -1, 1, 1, -1, 1, 0, 0 };

bool mas[45][45];

vector < pair < int, int > > line;

int coord_x = 0;
int coord_y = 0;//положение мышки

int x = 150;
int y = 200;//координаты шарика
int k = 0;//показатель направления
int ax = 0, ay = 0;//курсор
int x_0 = 0, y_0 = 0, xk = 0, yk = 0;

int r = 30;//отступ

int t = 7;//регулирует скорость

int x_back;
int y_back;
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

void LoadTextures() {
	AUX_RGBImageRec *texture1 = auxDIBImageLoadA("field.bmp");
	AUX_RGBImageRec *texture2 = auxDIBImageLoadA("run.bmp");
	AUX_RGBImageRec *texture3 = auxDIBImageLoadA("speed.bmp");
	AUX_RGBImageRec *texture4 = auxDIBImageLoadA("new.bmp");
	glGenTextures(4, &texture[0]);
	glBindTexture(GL_TEXTURE_2D, texture[0]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture1->sizeX, texture1->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture1->data);
	glBindTexture(GL_TEXTURE_2D, texture[1]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture2->sizeX, texture2->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture2->data);
	glBindTexture(GL_TEXTURE_2D, texture[2]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture3->sizeX, texture3->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture3->data);
	glBindTexture(GL_TEXTURE_2D, texture[3]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, texture4->sizeX, texture4->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, texture4->data);
}

void Display()
{
	glClear(GL_COLOR_BUFFER_BIT);
	glPointSize(58.0);
	glPushMatrix();
	glColor3f(1.0, 1.0, 1.0);
	//glBindTexture(GL_TEXTURE_2D, texture[0]);
	//glBegin(GL_POLYGON);
	//glTexCoord2f(0.0, 1.0); glVertex2f(0, 0);
	//glTexCoord2f(1.0, 1.0); glVertex2f(Height, 0);
	//glTexCoord2f(1.0, 0.0); glVertex2f(Height, Height);
	//glTexCoord2f(0.0, 0.0); glVertex2f(0, Height);
	//glEnd();//field
	glBindTexture(GL_TEXTURE_2D, 0);
	glColor3f(0.3, 0.3, 0.3);
	polygon(Height, Width, 0, Height);//правая часть экрана
	glColor3f(0.3, 0.5, 0.7);//--------------------------рамка----------------------------
	polygon(0, Height, 0, r - 10);
	polygon(Height - r + 10, Height, 0, Height);
	polygon(0, r - 10, 0, Height);
	polygon(0, Height, Height - r + 10, Height);
	glColor3f(1.0, 1.0, 1.0);//-----------------------------------------------------------
	glColor3f(0.5, 0.0, 0.5);
	for (int i = 0; i < line.size(); i++)
	{
		polygon(line[i].first, line[i].first + r - 10, line[i].second, line[i].second + r - 10);//курсор
	}
	glColor3f(1.0, 1.0, 1.0);
	if (pusk)
		glBindTexture(GL_TEXTURE_2D, texture[1]);
	else
		glBindTexture(GL_TEXTURE_2D, texture[3]);
	glBegin(GL_POLYGON);
	glTexCoord2f(0.0, 1.0); glVertex2f(Height + 60, 100);
	glTexCoord2f(1.0, 1.0); glVertex2f(Width - 60, 100);
	glTexCoord2f(1.0, 0.0); glVertex2f(Width - 60, 160);
	glTexCoord2f(0.0, 0.0); glVertex2f(Height + 60, 160);
	glEnd();//-------------------------------------------пуск-----------------------------
	glBindTexture(GL_TEXTURE_2D, 0);
	/*drawCircle(x, y, r, 30);*/
	glEnable(GL_POINT_SMOOTH);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glColor3f(1.0, 0.0, 0.0);
	glBegin(GL_POINTS);
	glVertex3f(x, y, 0.0);
	glEnd();
	/*glReadPixels(0, 0, 1, 1, GL_RGB, GL_FLOAT, pixx);
	if (pixx[0] == float(0.3))
		pusk = (pusk + 1) % 2;*/
	if (!pusk)
	{
		if (y == r)
		{
			if (x == r)
				k = 3;
			else if (x == Height - r)
				k = 2;
			else
				k += 2;
		}
		else if (y == Height - r)
		{
			if (x == r)
				k = 1;
			else if (x == Height - r)
				k = 0;
			else
				k -= 2;
		}
		else
		{
			if (x == r)
				k += 1;
			else if (x == Height - r)
				k -= 1;
		}
		x += dx[k];
		y += dy[k];
	}
	Sleep(t);
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
	{
		for (int j = 0; j < 45; j++)
		{
			mas[i][j] = true;
		}
	}
	for (int i = 0; i < 45; i++)
	{
		mas[0][i] = false;
		mas[44][i] = false;
		mas[i][0] = false;
		mas[i][44] = false;
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
			x_back = coord_x;
			y_back = coord_y;
		}
		else
		{
			coord_x = x;
			coord_y = y;
			if (coord_x != x_back || coord_y != y_back)
			{
			}

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
		if(ax) ax -= 20; break;
	case GLUT_KEY_RIGHT:
		if(ax < 880) ax += 20; break;
	case GLUT_KEY_UP:
		if(ay) ay -= 20; break;
	case GLUT_KEY_DOWN:
		if(ay < 880) ay += 20; break;
	}
	if (mas[ay / 20][ax / 20] == false)
	{
		for (int i = 0; i < line.size(); i++)
		{
			mas[line[i].second / 20][line[i].first / 20] = false;
		}
		line.clear();
		yk = ay;
		xk = ax;
		y_0 = yk;
		x_0 = xk;
	}
	line.push_back(make_pair(ax, ay));
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