// joewe275: Samarbetat med matol699, Mattis Olevall, samma program

#include <string>
#include <iostream>
#include <iomanip>
#include <limits>
#include <cmath>

const int FACTORIAL = 1;
const int MULTIPLY_STRING = 2;
const int SWITCH_PLACES = 3;
const int CALCULATE_LENGTH = 4;
const int EXIT = 5;

void clear_input()
{
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

int op_factorial(int const n)
{
    int result{1};

    for (int i{1}; i <= n; i++)
    {
        result *= i;
    }

    return result;
}

void subprogram_factorial()
{
    int n, result;

    std::cout << "Mata in ett heltal: ";
    std::cin >> n;
    clear_input();
    result = op_factorial(n);
    std::cout << "Fakulteten av " << n << " är " << result << std::endl;
}

std::string op_multiply_string(std::string const &text,
                               int const multiplier)
{
    std::string result;

    for (int i{0}; i < multiplier; i++)
    {
        result += text;
    }

    return result;
}

void subprogram_multiply_string()
{
    std::string text, result;
    int multiplier;

    std::cout << "Mata in en text och ett heltal: ";
    std::cin >> text >> multiplier;
    clear_input();
    result = op_multiply_string(text, multiplier);
    std::cout << "Den multiplicerade texten är " << result << std::endl;
}

void op_switch_places(int &a, float &b)
{
    int tmp{a};
    a = static_cast<int>(std::ceil(b));
    b = static_cast<float>(tmp);
}

void subprogram_switch_places()
{
    int a;
    float b;

    std::cout << "Mata in ett heltal och ett flyttal: ";
    std::cin >> a >> b;
    clear_input();
    op_switch_places(a, b);
    std::cout
        << "Heltalets värde är nu " << a << "\n"
        << "Flyttalets värde är nu " << std::fixed << std::setprecision(1) << b << std::endl;
}

void op_calculate_length(std::string const &text_1,
                         std::string const &text_2,
                         int &total_length,
                         float &average_length)
{
    total_length = text_1.length() + text_2.length();
    average_length = static_cast<float>(total_length) / 2.0f;
}

void subprogram_calculate_length()
{
    int total_length;
    float average_length;

    std::cout << "Mata in två ord: ";
    std::string text_1, text_2;
    std::cin >> text_1 >> text_2;
    clear_input();
    op_calculate_length(text_1, text_2, total_length, average_length);
    std::cout
        << "Totallängd: " << total_length << "\n"
        << "Medellängd: " << std::fixed << std::setprecision(1) << average_length << std::endl;
}

void dispatch(int const subprogram)
{
    switch (subprogram)
    {
    case FACTORIAL:
        subprogram_factorial();
        break;
    case MULTIPLY_STRING:
        subprogram_multiply_string();
        break;
    case SWITCH_PLACES:
        subprogram_switch_places();
        break;
    case CALCULATE_LENGTH:
        subprogram_calculate_length();
        break;
    }
}

int menu()
{
    while (true)
    {
        int choice;

        std::cout
            << "1. Beräkna N-fakultet.\n"
            << "2. Multiplicera en sträng.\n"
            << "3. Byta värden på ett heltal och ett flyttal.\n"
            << "4. Beräkna totala längden samt medellängden på två strängar.\n"
            << "5. Avsluta programmet.\n"
            << "Val: ";

        std::cin >> choice;
        clear_input();

        if (choice < 1 || choice > 5)
        {
            std::cout << "Fel val!" << std::endl;
            continue;
        }

        return choice;
    }
}

int main()
{
    std::cout << "Välkommen till huvudmenyn!" << std::endl;

    while (true)
    {
        int subprogram{menu()};

        if (subprogram == EXIT)
        {
            std::cout << "Ha en bra dag!" << std::endl;
            break;
        }

        dispatch(subprogram);
    }

    return 0;
}
