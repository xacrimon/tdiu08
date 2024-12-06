#include <algorithm>
#include <fstream>
#include <sstream>

#include "register_handling.h"

void load_file(Register_Type &reg, std::string const &file_path)
{
    std::ifstream ifs{file_path};
    std::string line;

    if (!ifs)
    {
        std::cout << "file" << std::endl;
        return;
    }

    while (std::getline(ifs, line))
    {
        std::istringstream iss{line};
        Hero_Type hero;
        iss >> hero;
        add_hero(reg, hero);
    }

    ifs.close();
}

void save_file(Register_Type &reg, std::string const &file_path)
{
    std::ofstream ofs{file_path};
    ofs << reg;
    ofs.close();
}

void add_hero(Register_Type &reg,
              Hero_Type const &hero)
{
    reg.insert(std::upper_bound(reg.begin(), reg.end(), hero), hero);
}

bool is_in_reg(Register_Type &reg,
               Hero_Type const &hero)
{
    return std::binary_search(reg.begin(), reg.end(), hero);
}

Register_Type match(Register_Type const &reg,
                    std::vector<int> const &interests)
{
    Register_Type matches;

    for (int i{0}; i < reg.size(); ++i)
    {
        Hero_Type hero = reg.at(i);

        for (int j{0}; j < hero.interests.size(); ++j)
        {
            for (int k{0}; k < interests.size(); ++k)
            {
                if (hero.interests.at(j) == interests.at(k))
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
    for (int i{0}; i < reg.size(); ++i)
    {
        os << reg.at(i) << std::endl;
    }

    return os;
}
