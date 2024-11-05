#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    int heltal;
    float flyttal;
    char tecken;
    string text;

    cout << "Skriv in ett heltal: ";
    cin >> heltal;
    cin.ignore(1000, '\n');
    cout << "Du skrev in heltalet: " << heltal << endl
         << endl;

    cout << "Skriv in fem heltal: ";
    cin >> heltal;
    cout << "Du skrev in heltalen: ";
    cout << heltal << " ";
    cin >> heltal;
    cout << heltal << " ";
    cin >> heltal;
    cout << heltal << " ";
    cin >> heltal;
    cout << heltal << " ";
    cin >> heltal;
    cin.ignore(1000, '\n');
    cout << heltal << endl
         << endl;

    cout << "Skriv in ett flyttal: ";
    cin >> flyttal;
    cin.ignore(1000, '\n');
    cout << "Du skrev in flyttalet: " << fixed << setprecision(3) << flyttal << endl
         << endl;

    cout << "Skriv in ett heltal och ett flyttal: ";
    cin >> heltal >> flyttal;
    cin.ignore(1000, '\n');
    cout
        << "Du skrev in heltalet:" << setw(10) << heltal << endl
        << "Du skrev in flyttalet:" << setw(9) << fixed << setprecision(4) << flyttal << endl
        << endl;

    cout << "Skriv in ett flyttal och ett heltal: ";
    cin >> flyttal >> heltal;
    cin.ignore(1000, '\n');
    cout
        << "Du skrev in heltalet:" << setfill('-') << setw(10) << heltal << endl
        << "Du skrev in flyttalet:" << setfill('-') << setw(9) << fixed << setprecision(4) << flyttal << endl
        << endl;

    cout << "Skriv in ett tecken: ";
    cin >> tecken;
    cin.ignore(1000, '\n');
    cout << "Du skrev in tecknet: " << tecken << endl
         << endl;

    cout << "Skriv in ett ord: ";
    cin >> text;
    cin.ignore(1000, '\n');
    cout << "Du skrev in ordet: " << text << endl
         << endl;

    cout << "Skriv in ett heltal och ett ord: ";
    cin >> heltal >> text;
    cin.ignore(1000, '\n');
    cout
        << "Du skrev in heltalet |" << heltal << "|"
        << " och ordet |" << text << "|." << endl
        << endl;

    cout << "Skriv in ett tecken och ett ord: ";
    cin >> tecken >> text;
    cin.ignore(1000, '\n');
    cout << "Du skrev in \"" << text << "\" och \"" << tecken << "\"." << endl
         << endl;

    cout << "Skriv in ett ord och ett tecken: ";
    cin >> text >> tecken;
    cin.ignore(1000, '\n');
    cout << "Du skrev in \"" << text << "\" och \"" << tecken << "\"." << endl
         << endl;

    cout << "Skriv in en textrad: ";
    getline(cin, text);
    cout << "Du skrev in \"" << text << "\"." << endl
         << endl;

    cout << "Skriv in en till rad text: ";
    getline(cin, text);
    cout << "Du skrev in \"" << text << "\"." << endl
         << endl;

    cout << "Skriv in en rad med tre ord: ";
    cin >> text;
    cout << "Du skrev in: ";
    cout << "\"" << text << "\", ";
    cin >> text;
    cout << "\"" << text << "\" och ";
    cin >> text;
    cin.ignore(1000, '\n');
    cout << "\"" << text << "\"." << endl
         << endl;
}
