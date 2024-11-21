#include "register_handling.h"

#include <algorithm>
#include <fstream>
#include <sstream>

void load_file(Register_Type &reg, std::string &file_path)
{
    std::ifstream ifs{file_path};

    if (!ifs)
    {
        std::cout << "file" << std::endl;
        return;
    }

    std::string line;
    while (std::getline(ifs, line))
    {
        std::istringstream iss{line};
        Hero_Type hero;
        iss >> hero;

        add_hero(reg, hero);
    }

    ifs.close();
}

void save_file(Register_Type &reg, std::string &file_path)
{
    std::ofstream ofs{file_path};

    ofs << reg;

    ofs.close();
}

void add_hero(Register_Type &reg,
              Hero_Type &hero)
{
    if (is_in_reg(reg, hero))
    {
        return;
    }
    reg.push_back(hero);
    std::sort(std::begin(reg), std::end(reg));
}

bool is_in_reg(Register_Type &reg,
               Hero_Type &hero)
{

    for (Hero_Type const &hero1 : reg)
    {
        if (hero.name == hero1.name)
        {
            return true;
        }
    }

    return false;
}

Register_Type match(Register_Type &reg,
                    std::vector<int> &interests)
{
    Register_Type matches;
    for (Hero_Type &hero : reg)
    {
        for (int interest : hero.interests)
        {
            for (int search_interest : interests)
            {
                if (interest == search_interest)
                {
                    add_hero(matches, hero);
                    break;
                }
            }
        }
    }

    return matches;
}

std::ostream &operator<<(std::ostream &os, Register_Type const &reg)
{
    for (Hero_Type const &hero : reg)
    {
        os << hero << std::endl;
    }

    return os;
}