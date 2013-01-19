#include <iostream>
#include <stdlib.h>
using namespace std;

int t, n, i, j, m;
int a[21], b[21], c[100];


int main(){

    cin >> t;
    for (int k = 0; k < t; k++){
        memset(a, 0, sizeof(a));
        memset(b, 0, sizeof(b));
        memset(c, 0, sizeof(c));
        m = 1;
        cin >> n;

        for (i = 1; i <= n; i++){
            cin >> a[i];
            m = m + a[i] - a[i - 1] + 1;
            b[i] = m - 1;
            c[m - 1] = 1;
        }

        for (i = 1; i <= n; i++){
            int ans = 0;
            int tmp = 0;
            for (j = b[i]; j > 0; j--){
                if (c[j] == 1){
                    tmp++;
                    ans++;
                } else {
                    tmp--;
                }
                if (tmp == 0){
                    break;
                }
            }
            cout << ans;
            cout << ' ';
        }
        cout << endl;
    }
    return 0;
}