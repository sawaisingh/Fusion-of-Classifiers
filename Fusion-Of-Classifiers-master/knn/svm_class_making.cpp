#include <iostream>
#include <cstdio>
#include <vector>
#include <map>
#include <cstring>
#include <cstdio>
#include <algorithm>
#include <set>
#include <queue>
#include <stack>
#include <cstdlib>
#include <string>
#include <list>
#include <bitset>
#include <iomanip>
#include <cmath>
#include <sstream>
#include <deque>
#include <climits>
#include <cassert>

using namespace std;

#define ull unsigned long long
#define ll long long
#define Max(x,y) ((x)>(y)?(x):(y))
#define Min(x,y) ((x)<(y)?(x):(y))
#define Sl(x) scanf("%lld",&x)
#define Su(x) scanf("%llu",&x)
#define S(x) scanf("%d",&x)
#define IS(x) cin>>x
#define ISF(x) getline(cin,x)
#define pii pair<int,int>
#define pll pair<ll,ll>
#define pps pair<ll,pll>
#define ppf pair<pll,ll>
#define psi pair<string,int>
#define pis pair<int,string>
#define fr first
#define se second
#define MOD 1000000007
#define MP(x,y) make_pair(x,y)
#define eps 1e-7
#define V(x) vector<x>
#define pb(x) push_back(x)
#define mem(x,i) memset(x,i,sizeof(x))
#define fori(i,s,n) for(i=(s);i<(n);i++)
#define ford(i,s,n) for(i=(n);i>=(s);--i)
#define INF 8944674407370955161LL
#define debug(i,st,arr) fori(i,0,st){cout<<arr[i]<<" ";}cout<<endl;
#define forci(i,sw) for((i)=(sw).begin();(i)!=(sw).end();(i)++)
#define forcd(i,sw) for((i)=(sw).rbegin();(i)!=(sw).rend();(i)++)

int abs(int x) {if(x < 0) return -x; return x;}
vector <string> v;
int ans[8];
int main()
{
	freopen("sat_knn.txt", "r", stdin);
	string s;
	
	map<int, int> m;
	while (cin >> s) {
		v.pb(s);
	}
	for (int i = 0; i < v.size(); i++) {
		int x = v[i][v[i].size() - 1] - '0';
		m[x]++;
	}
	for (map<int, int>::iterator it = m.begin(); it != m.end(); it++) {
		int x = it->first;
		char c = (char)(x + '0');
		string c1 = "";
		c1 = c1 + c;
		string na = "sat_knn_mis_test_class"+c1+".txt";
		freopen(na.c_str(), "w", stdout);
		
		for (int i = 0; i < v.size(); i++) {
			int y = v[i][v[i].size() - 1] - '0';
			cout << v[i].substr(0, v[i].size() - 1);
			if (y == x) {
				ans[x]++;
				cout << 1 << endl;
			} else {
				cout << 0 << endl;
			}
		}
		
	}
	/*for (int i = 1; i < 8; i++) {
		cout << ans[i] << endl;
	}*/
	return 0;
}


