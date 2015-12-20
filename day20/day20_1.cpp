#include <iostream>
#include <vector>
using std::cout;
using std::vector;

vector<int> factor(int a) {
	vector<int> result;
	for(int i = 1; i <= a; i++) {
		if(a % i == 0) {
			result.push_back(i);
		}
	}

	return result;
}

long long sigma(vector<int> vec) {
	long long result = 0;

	for(int i: vec) {
		result += i*10;
	}

	return result;
}

int main() {
	long long goal = 33100000;

	long i = 776000; // Discovered after increasing the increment each step by large numbers

	while(true) {
		vector<int> factors = factor(i);

		long long factor_sum = sigma(factors);
		cout << "I: " << i << "\tSum: " << factor_sum << '\n';

		if(factor_sum >= goal) break;

		i+= 1;
	}

	cout << "DONE: " << i << '\n';

	return 0;
}
