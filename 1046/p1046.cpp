
#include <stdio.h>
#include <iostream>
#include <cmath>
using namespace std;


typedef struct{
    int r,g,b;
    /* data */
}color;

int r,g,b;
int ans, ans_i, tmp;
int i;
color base[16];

int sqr(int x){
    return x*x;
}

int main(){
    for (i=0; i<16; i++)
        cin >> base[i].r >> base[i].g >> base[i].b;
    while (true){
        
        cin >> r >> g >> b;
        if (r==-1&&g==-1&&b==-1) break;

        ans = 0xfffff;
        for (i=0; i<16; i++){
            tmp = sqrt((float)(sqr(r-base[i].r)+sqr(g-base[i].g)+sqr(b-base[i].b)));
            if (tmp < ans){
                ans_i = i;
                ans = tmp;
            }
        }
        cout << '(' << r << ',' << g << ',' << b << ") maps to (";
        cout << base[ans_i].r << ',' << base[ans_i].g << ',' << base[ans_i].b << ')' << endl;
    }
return 0;
}