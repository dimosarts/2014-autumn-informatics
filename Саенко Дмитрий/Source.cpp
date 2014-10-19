#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
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

GLuint texture[3];
queue < pair <int, int> > q;

float Width = 985.0;
float Height = 675.0;

int dx[] = { -1, 1, -1, 1, 0, 0, -1, 1, 0 };
int dy[] = { -1, -1, 1, 1, -1, 1, 0, 0, 0 };

int tx[] = { 1, -1, 0, 0 };
int ty[] = { 0, 0, 1, -1 };

int mas1[45][45];

vector < pair < int, int > > line;

int coord_x = 0;
int coord_y = 0;//положение мышки

int x = 150;
int y = 300;//координаты шарика
int k = 0;//показатель направления
int ax = 0, ay = 0;//курсор
int a = 0;
int ab[9] = { 0, 0, 0, 0, 0, 0, 0, 0, 0 };
int z = 0;
int Sum = 0;
int ind_x = Height + 10, ind_y = Height - 200, ind = 30, ind_x1 = Height + 30, ind_y1 = Height - 170;
int life = 3;

int r = 15;//отступ

int zx[] = { 0, 0, r, -r };
int zy[] = { r, -r, 0, 0 };

int t = 10;//регулирует скорость
int pusk = 0;//пуск/пауза

void fill_area(int a, int b) {
	q.push(make_pair(a, b));
	Sum = 0;
	while (!(q.empty()))
	{
		pair <int, int> cur = q.front();
		q.pop();
		for (int k = 0; k < 4; k++)
		{
			if (mas1[cur.first + tx[k]][cur.second + ty[k]] == 0)
			{
				mas1[cur.first + tx[k]][cur.second + ty[k]] = 5;
				q.push(make_pair(cur.first + tx[k], cur.second + ty[k]));
			}
		}
	}
	for (int i = 0; i < 45; i++)
		for (int j = 0; j < 45; j++)
		{
			if (!mas1[i][j])
				mas1[i][j] = -2;
			else if (mas1[i][j] == 5)
			{
				Sum++;
				mas1[i][j] = 0;
			}
		}
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
	if (mas1[ay / r][ax / r] == -2)
	{
		if (line.size() > 1)
		{
			for (int i = 0; i < line.size(); i++)
				mas1[line[i].second / r][line[i].first / r] = 1;
			fill_area(y / r, x / r);
		}
		for (int i = 0; i < line.size(); i++)
			mas1[line[i].second / r][line[i].first / r] = -2;
		line.clear();
	}
	if (line.size() > 0)
	{
		if (line[line.size() - 1].first != ax || line[line.size() - 1].second != ay)
			line.push_back(make_pair(ax, ay));
	}
	else
		line.push_back(make_pair(ax, ay));
}

void guide(int a) {
	if (!ab[6] && !ab[4] && !ab[7] && !ab[5] || (!ab[0] && !ab[1] && !ab[2] && !ab[3]))
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
	else if ((!ab[6] && !ab[4]) || (!ab[0] && ab[6] && ab[4] && ab[1] && ab[7] && ab[3]))
		k = 3;
	else if ((!ab[5] && !ab[7]) || (!ab[3] && ab[5] && ab[7] && ab[0] && ab[6] && ab[2]))
		k = 0;
	else if ((!ab[4] && !ab[7]) || (!ab[1] && ab[4] && ab[7] && ab[0] && ab[6] && ab[2]))
		k = 2;
	else if ((!ab[6] && !ab[5]) || (!ab[2] && ab[6] && ab[5] && ab[1] && ab[7] && ab[3]))
		k = 1;
	else if (!ab[6])
	{
		if (ab[1] && ab[3])
			k++;
		else
			k = -k + 3;
	}
	else if (!ab[7])
	{
		if (ab[0] && ab[2])
			k--;
		else
			k = -k + 3;
	}
	else if (!ab[4])
	{
		if (ab[2] && ab[3])
			k += 2;
		else
			k = -k + 3;
	}
	else if (!ab[5])
	{
		if (ab[0] && ab[1])
			k -= 2;
		else
			k = -k + 3;
	}
}

void LoadTextures() {
	AUX_RGBImageRec *texture1 = auxDIBImageLoadA("run.bmp");
	AUX_RGBImageRec *texture2 = auxDIBImageLoadA("pause.bmp");
	AUX_RGBImageRec *texture3 = auxDIBImageLoadA("new.bmp");
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
}

void Display()
{
	glClear(GL_COLOR_BUFFER_BIT);
	glPushMatrix();
	glColor3f(1.0, 1.0, 1.0);
	glBindTexture(GL_TEXTURE_2D, 0);
	glColor3f(0.3, 0.3, 0.3);
	polygon(Height, Width, 0, Height);//правая часть экрана
	glColor3f(1.0, 1.0, 0.3);
	for (int i = 0; i < 11 - t; i++)
		polygon(ind_x + ind * i, ind_x1 + ind * i, ind_y, ind_y1);//уровень
	glColor3f(0.7, 0.2, 0.3);
	for (int i = 0; i < life; i++)
		polygon(ind_x + ind * i, ind_x1 + ind * i, ind_y + 40, ind_y1 + 40);//жизни
	glColor3f(0.1, 0.1, 0.7);//--------------------------рамка----------------------------
	for (int i = 0; i < 45; i++)
		for (int j = 0; j < 45; j++)
			if (mas1[i][j])
				polygon(j * r, j * r + r, i * r, i * r + r);
	//-------------------------------------------------------------------------------------
	glColor3f(0.0, 0.0, 0.0);//---------------------------------курсор------------------------
	for (int i = 0; i < line.size(); i++)
	{
		polygon(line[i].first, line[i].first + r, line[i].second, line[i].second + r);
		if (x / r == line[i].first / r && y / r == line[i].second / r && line.size() > 1)//-----delete line-----
		{
			life--;
			if (!life)
				pusk = 1;
			for (int j = 1; j < line.size(); j++)
				mas1[line[j].second / r][line[j].first / r] = 0;
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
	glBindTexture(GL_TEXTURE_2D, texture[2]);
	glBegin(GL_POLYGON);//----------------------------------------------------------------
	glTexCoord2f(0.0, 1.0); glVertex2f(Height + 60, 400);
	glTexCoord2f(1.0, 1.0); glVertex2f(Width - 60, 400);
	glTexCoord2f(1.0, 0.0); glVertex2f(Width - 60, 460);
	glTexCoord2f(0.0, 0.0); glVertex2f(Height + 60, 460);
	glEnd();//-------------------------------------------новая игра-----------------------------
	glBindTexture(GL_TEXTURE_2D, 0);
	/*drawCircle(x, y, r - 10, 30);*/
	glPointSize(58.0);
	glEnable(GL_POINT_SMOOTH);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glBegin(GL_POINTS);
	glColor3f(1.0, 0.0, 0.0);
	glVertex3f(x, y, 0.0);//шарик
	glEnd();
	if (!pusk)
	{
		cursor_move();
		glBegin(GL_POINTS);
		x += dx[k];
		y += dy[k];
		Sleep(t);
		glVertex3f(x, y, 0.0);//шарик
		glEnd();
		if (y % r == r / 2 && x % r == r / 2)
		{

			if (ax + zx[z] >= 0 && ax + zx[z] < Height && ay + zy[z] >= 0 && ay + zy[z] < Height && mas1[(ay + zy[z]) / r][(ax + zx[z]) / r] == 0 && mas1[ay / r][ax / r] == 1)
			{
				cursor_move();
				ax += zx[z];
				ay += zy[z];
			}
			else if (mas1[ay / r][ax / r] != -2)
			{
				ax += zx[z];
				ay += zy[z];
				cursor_move();
			}
			a = 0;
			for (int i = 0; i < 8; i++)
			{
				if (mas1[y / r + dy[i]][x / r + dx[i]] == -2)
				{
					ab[i] = 0;
					a++;
				}
				else
				{
					ab[i] = 1;
				}
			}
			guide(k);
		}
	}
	if (Sum < 305 && Sum)
	{
		if (t > 1)
			t--;
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
		Sum = 0;
		ax = 0;
		ay = 0;
		line.clear();
		line.push_back(make_pair(0, 0));
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
	{
		mas1[i][j] = 0;
	}
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

void mouseButton(int button, int state, int x1, int y1)
{
	if (button == GLUT_LEFT_BUTTON) {
		if (state == GLUT_DOWN) {
			coord_x = x1;
			coord_y = y1;
		}
		else
		{
			coord_x = x1;
			coord_y = y1;

			//-------------------------------------- пуск -----------------------------------

			if (coord_x >= Height + 60 && coord_x <= Width - 60 && coord_y >= 100 && coord_y <= 160 && life)
			{
				pusk = (pusk + 1) % 2;
			}

			//----------------------------------- конец/пуск --------------------------------

			if (coord_x >= Height + 60 && coord_x <= Width - 60 && coord_y >= 400 && coord_y <= 460 && life)
			{
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
				Sum = 0;
				line.clear();
				line.push_back(make_pair(0, 0));
				x = 150;
				y = 300;
				k = 0;
				ax = 0, ay = 0;
				a = 0;
				z = 0;
				life = 3;
				t = 10;
				pusk = 0;
			}

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
		if (ax && (z != 2 || mas1[ay / r][ax / r] == -2)) z = 3; break;
	case GLUT_KEY_RIGHT:
		if (ax < Height - r && (z != 3 || mas1[ay / r][ax / r] == -2)) z = 2; break;
	case GLUT_KEY_UP:
		if (ay && (z != 0 || mas1[ay / r][ax / r] == -2)) z = 1; break;
	case GLUT_KEY_DOWN:
		if (ay < Height - r && (z != 1 || mas1[ay / r][ax / r] == -2)) z = 0; break;
	}
	if (ax + zx[z] >= 0 && ax + zx[z] < Height && ay + zy[z] >= 0 && ay + zy[z] < Height && mas1[ay / r][ax / r] == -2)
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
	glutInitWindowPosition(50, 50);
	glutCreateWindow("Ball");
	glutDisplayFunc(Display);
	Initialize();
	glutMouseFunc(mouseButton);
	glutMotionFunc(mouseMove);
	glutKeyboardFunc(Keyboard);
	glutSpecialFunc(specialKeys);
	glutMainLoop();
}