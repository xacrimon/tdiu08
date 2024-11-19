// joewe275: Samarbetat med matol699, Mattis Olevall, samma program

#include <string>
#include <iostream>
#include <iomanip>
#include <limits>
#include <cmath>

static void clear_input()
{
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

static int op_factorial(const int n)
{
    int result{1};

    for (int i{1}; i <= n; i++)
        result *= i;

    return result;
}

static void subprogram_factorial()
{
    std::cout << "Mata in ett heltal: ";
    int n;
    std::cin >> n;
    clear_input();
    const int result = op_factorial(n);
    std::cout << "Fakulteten av " << n << " är " << result << std::endl;
}

static std::string op_multiply_string(const std::string &text, const int multiplier)
{
    std::string result;

    for (int i{0}; i < multiplier; i++)
        result += text;

    return result;
}

static void subprogram_multiply_string()
{
    std::cout << "Mata in en text och ett heltal: ";
    std::string text;
    int multiplier;
    std::cin >> text >> multiplier;
    clear_input();
    const std::string result = op_multiply_string(text, multiplier);
    std::cout << "Den multiplicerade texten är " << result << std::endl;
}

static void op_switch_places(int &a, float &b)
{
    const int tmp{a};
    a = static_cast<int>(std::ceil(b));
    b = static_cast<float>(tmp);
}

static void subprogram_switch_places()
{
    std::cout << "Mata in ett heltal och ett flyttal: ";
    int a;
    float b;
    std::cin >> a >> b;
    clear_input();
    op_switch_places(a, b);
    std::cout
        << "Heltalets värde är nu " << a << "\n"
        << "Flyttalets värde är nu " << std::fixed << std::setprecision(1) << b << std::endl;
}

static void op_calculate_length(const std::string &text_1, const std::string &text_2, int &total_length, float &average_length)
{
    total_length = text_1.length() + text_2.length();
    average_length = static_cast<float>(total_length) / 2.0f;
}

static void subprogram_calculate_length()
{
    std::cout << "Mata in två ord: ";
    std::string text_1, text_2;
    std::cin >> text_1 >> text_2;
    clear_input();
    int total_length;
    float average_length;
    op_calculate_length(text_1, text_2, total_length, average_length);
    std::cout
        << "Totallängd: " << total_length << "\n"
        << "Medellängd: " << std::fixed << std::setprecision(1) << average_length << std::endl;
}

const int FACTORIAL = 1;
const int MULTIPLY_STRING = 2;
const int SWITCH_PLACES = 3;
const int CALCULATE_LENGTH = 4;
const int EXIT = 5;

static void dispatch(const int subprogram)
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

static int menu()
{
    for (;;)
    {
        std::cout
            << "1. Beräkna N-fakultet.\n"
            << "2. Multiplicera en sträng.\n"
            << "3. Byta värden på ett heltal och ett flyttal.\n"
            << "4. Beräkna totala längden samt medellängden på två strängar.\n"
            << "5. Avsluta programmet.\n"
            << "Val: ";

        int choice;
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

    for (;;)
    {
        const int subprogram{menu()};

        if (subprogram == EXIT)
        {
            std::cout << "Ha en bra dag!" << std::endl;
            break;
        }

        dispatch(subprogram);
    }

    return 0;
}
