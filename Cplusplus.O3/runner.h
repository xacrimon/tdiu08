#pragma once

#include <ostream>
#include <string>
#include <vector>

struct Runner_Type
{
    std::string first_name, last_name, club;
    std::vector<double> times;
};

bool operator<(const Runner_Type &left, const Runner_Type &right);

std::ostream &operator<<(std::ostream &os, const Runner_Type &runner);