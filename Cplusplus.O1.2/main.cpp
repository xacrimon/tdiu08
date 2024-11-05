#include <iostream>
#include <iomanip>
#include <cctype>

using namespace std;

int main()
{
    // Del 1
    int start, end;

    cout << "Del 1: Temperaturtabell" << endl;
    do
    {
        cout << "Ange startvärde: ";
        cin >> start;
        cin.ignore(1000, '\n');
        if (start < -273)
            cout << "Felaktigt startvärde!" << endl;
    } while (start < -273);

    do
    {
        cout << "Ange slutvärde: ";
        cin >> end;
        cin.ignore(1000, '\n');
        if (end < start)
            cout << "Felaktigt slutvärde!" << endl;
    } while (end < start);

    cout << "Celsius   Kelvin   Fahrenheit   Reamur" << endl;
    cout << "--------------------------------------" << endl;
    for (int i = 0; i < end - start + 1; i++)
    {
        cout << setw(7) << start + i;
        cout << setw(9) << fixed << setprecision(2) << static_cast<float>(start + i) + 273.15f;
        cout << setw(13) << fixed << setprecision(2) << static_cast<float>(start + i) * 1.8f + 32.f;
        cout << setw(9) << fixed << setprecision(2) << static_cast<float>(start + i) * 0.8f;
        cout << endl;
    }
    cout << "--------------------------------------" << endl;
    cout << endl;

    // Del 2

    int alpha{0}, digit{0}, space{0};
    string line;
    char c;

    cout << "Del 2: Teckenhantering" << endl;

    for (int i = 0; i < 10; i++)
    {
        cin.get(c);
        if (isalpha(c))
            alpha++;
        if (isdigit(c))
            digit++;
        if (isspace(c))
            space++;
    }
    cin.ignore(1000, '\n');
    cout << endl;

    cout << "Texten innehöll:" << endl;
    cout << "Alfabetiska tecken:" << alpha << endl;
    cout << "Siffertecken......:" << digit << endl;
    cout << "Vita tecken.......:" << space << endl;
    cout << endl;

    // Del 3

    string text, tmp, shortest, longest;
    int wordCount{0}, charCount{0};

    cout << "Del 3: Ordhantering" << endl;
    cout << "Mata in en text" << endl;

    while (!cin.eof())
    {
        cin.get(c);
        if (isspace(c))
        {
            if (tmp == "")
                continue;

            if (shortest == "")
                shortest = tmp;

            wordCount++;
            charCount += tmp.length();
            if (tmp.length() > longest.length())
                longest = tmp;
            if (tmp.length() < shortest.length())
                shortest = tmp;
            tmp = "";
        }
        else
            tmp.push_back(c);
    }

    if (wordCount != 0)
    {
        cout << "Texten innehöll " << wordCount << " ord." << endl;
        cout << "Det kortaste ordet var \""
             << shortest << "\" med "
             << shortest.length() << " tecken."
             << endl;
        cout << "Det längsta ordet var \""
             << longest << "\" med "
             << longest.length() << " tecken."
             << endl;
        cout << "Medelordlängden var "
             << fixed
             << setprecision(1)
             << static_cast<float>(charCount) / static_cast<float>(wordCount)
             << " tecken."
             << endl;
    }
    else
        cout << "Inga ord matades in." << endl;
}