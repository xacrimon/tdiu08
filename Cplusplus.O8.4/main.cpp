#include <iostream>
#include <string>

#include "register_handling.h"

void add_hero_program(Register_Type &reg)
{
    std::string line;
    Hero_Type hero;

    while (true)
    {
        std::istringstream iss;
        std::cout << "Enter hero information:" << std::endl;
        std::getline(std::cin, line);
        iss.str(line);
        iss >> hero;
        if (is_in_reg(reg, hero))
        {
            std::cout << "Hero already in register. ";
            continue;
        }

        add_hero(reg, hero);
        break;
    }
}

void match_program(Register_Type &reg)
{
    int interest;
    std::vector<int> interests;
    Register_Type matches;
    std::string line;
    std::istringstream iss;

    std::cout << "Enter your interests (at least one between 1 and 15): ";
    do
    {
        std::cin >> interest;
    } while (interest < 1 || interest > 15);
    interests.push_back(interest);

    std::getline(std::cin, line);
    iss.str(line);
    while (iss >> interest)
        interests.push_back(interest);

    matches = match(reg, interests);

    std::cout << "There are " << matches.size() << " matching heroes." << std::endl;
    std::cout << "Hero name  Birth year  Weight  Hair color  Interests" << std::endl;
    std::cout << "====================================================" << std::endl;
    std::cout << matches;
}

int menu()
{
    int selection{};

    std::cout << "1) Add new hero to register file" << std::endl;
    std::cout << "2) Find matching heroes" << std::endl;
    std::cout << "3) Quit" << std::endl;

    do
    {
        std::cout << "Select: ";
        std::cin >> selection;
    } while (selection < 1 || selection > 3);

    std::cin.ignore(1000, '\n');

    return selection;
}

int main(int argc, char *argv[])
{
    Register_Type heroes;
    std::string file;

    if (argc != 2)
    {
        std::cout << "Incorrect number of arguments!" << std::endl;
        std::cout << "Usage: " << argv[0] << " REGISTERFILE" << std::endl;
    }

    file = argv[1];
    load_file(heroes, file);

    std::cout << "Welcome to Hero Matchmaker 3000!" << std::endl;
    while (true)
    {
        switch (menu())
        {
        case 1:
            add_hero_program(heroes);
            save_file(heroes, file);
            std::cout << "The hero was added to the register on file " << file << std::endl;
            break;
        case 2:
            match_program(heroes);
            break;
        case 3:
            return false;
        }
    }

    return 0;
}
