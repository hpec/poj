#include <iostream>
using namespace std;

int l[5000], w[5000];
int i, n, t, cw, cl, ans;

void qsort(int p, int q){
    int i, j, tmp, midl, midw;
    i = p;
    j = q;
    midl = l[(i + j) / 2];
    midw = w[(i + j) / 2];
    while (i < j){
        while (l[i] < midl || (l[i] == midl && w[i] < midw)) i++;
        while (l[j] > midl || (l[j] == midl && w[j] > midw)) j--;
        if (i <= j){
            tmp = l[i];
            l[i] = l[j];
            l[j] = tmp;
            tmp = w[i];
            w[i] = w[j];
            w[j] = tmp;
            i++; j--;
        }
    }
    if (i < q) qsort(i, q);
    if (j > p) qsort(p, j);
}

int main(){
    cin >> t;
    while (t--){
        cin >> n;
        ans = 0;
        cl = 1000000;
        cw = 1000000;
        for (i = 0; i < n; i++){
            cin >> l[i] >> w[i];
        }

        qsort(0, n-1);
        for (i = 0; i < n; i++){
            if (!(l[i] >= cl && w[i] >= cw)){
                ans++;
                cl = l[i];
                cw = w[i];
            }
        }
        cout << ans << endl; 
    }
}