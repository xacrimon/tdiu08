#pragma once

#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

struct Hero_Type
{
    std::string name;
    int birth_year;
    float weight;
    std::string hair_color;
    std::vector<int> interests;
};

bool operator<(Hero_Type const &left,
               Hero_Type const &right);

std::ostream &operator<<(std::ostream &os, Hero_Type const &hero);
std::istream &operator>>(std::istream &is, Hero_Type &hero);