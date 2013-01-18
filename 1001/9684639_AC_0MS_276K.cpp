#include "stdio.h" 
#include <string>
#include <iostream>
using namespace std;

void mul(int *a, int *b, int *c){

	int i,j;
	for (i=1; i<=a[0]; i++){
		for (j=1; j<=b[0]; j++){
			c[i+j-1] += a[i]*b[j];
			c[i+j] += c[i+j-1] / 10;
			c[i+j-1] = c[i+j-1] % 10;
			}
		}
	c[0] = a[0] + b[0];
	while (c[c[0]] == 0){
		c[0] -= 1;
		}
	}
			
int main(){
       int i,n,pos,k;
       int a[6],tmp[600],result[600];
       string s;
       memset(a,0,sizeof(a));
       memset(result,0,sizeof(result));
       
       while (cin >> s >> n){
             
             pos = s.find(".");
             if (pos!=-1){
                s.erase(pos,1);
                pos = (s.length()-pos)*n;
                }
             for (i=0; i<=s.length()-1; i++){
                 a[s.length()-i] = s[i] - '0';
                 result[s.length()-i] = s[i] - '0';
                 }
             a[0] = s.length();
             result[0] = s.length();
             for (k=1; k<n; k++){
                 memset(tmp,0,sizeof(tmp));
	             mul(a,result,tmp);
	             for (i=0; i<=tmp[0]; i++) result[i] = tmp[i];
                 }
             int start = 1;
             while (result[start] == 0 && pos>=start){
                   start += 1;
                   }
             if (pos >= result[0]){
                     cout << ".";
                     for (i=1; i<=pos-result[0]; i++) cout << 0;
                     for (i=result[0]; i>=start; i--) cout << result[i];
                     }
             else{
                  for (i=result[0]; i>=start; i--){
                      cout << result[i];
                      if (i-1==pos&&i!=start) cout << ".";
                      }
                  }
             cout << endl;
             //break;
             }
       return 0;
       }
