#include <algorithm>
#include <iostream>
#include <vector>

#include "runner.h"

using namespace std;

using Runner_Vec = vector<Runner_Type>;

void print_runners(const Runner_Vec &runners)
{
    cout << "Efternamn   Förnamn           Klubb: Tider" << endl;
    cout << "==========================================" << endl;
    for (const Runner_Type &runner : runners)
        cout << runner << endl;
}

Runner_Vec get_runners()
{
    Runner_Vec runners;
    cout << "Mata in deltagare:" << endl;
    while (true)
    {
        Runner_Type runner;
        cin >> runner.first_name;
        if (runner.first_name == "KLAR")
            break;
        cin >> runner.last_name;
        getline(cin, runner.club);
        runners.push_back(runner);
    }

    cin.ignore(1000, '\n');

    return runners;
}

void get_times(Runner_Vec &runners)
{
    for (Runner_Type &runner : runners)
    {
        double time{};
        cout << "Tider " << runner.first_name << ": ";
        while (time != -1.0)
        {
            cin >> time;
            runner.times.push_back(time);
        }
        cin.ignore(1000, '\n');
        time = 0.0;
        runner.times.pop_back();
        sort(runner.times.begin(), runner.times.end());
    }
}

int main()
{
    Runner_Vec runners{get_runners()};

    get_times(runners);

    sort(begin(runners), end(runners));

    print_runners(runners);

    return 0;
}