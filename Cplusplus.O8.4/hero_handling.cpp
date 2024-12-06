#include <algorithm>

#include "hero_handling.h"

bool operator<(Hero_Type const &left,
               Hero_Type const &right)
{
    return left.name < right.name;
}

std::ostream &operator<<(std::ostream &os, Hero_Type const &hero)
{
    os << std::left << std::setw(11) << hero.name;
    os << std::setw(12) << hero.birth_year;
    os << std::setw(8) << std::fixed << std::setprecision(2) << hero.weight;
    os << std::setw(12) << hero.hair_color;

    for (int i{0}; i < hero.interests.size(); ++i)
    {
        os << std::right << std::setw(3) << hero.interests.at(i);
    }

    return os;
}

std::istream &operator>>(std::istream &is, Hero_Type &hero)
{
    int interest;
    is >> hero.name;
    is >> hero.birth_year;
    is >> hero.weight;
    is >> hero.hair_color;

    while (is >> interest)
    {
        hero.interests.push_back(interest);
    }

    std::sort(std::begin(hero.interests), std::end(hero.interests));
    return is;
}
