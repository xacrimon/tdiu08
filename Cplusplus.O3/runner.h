#pragma once

#include <ostream>
#include <string>
#include <vector>

struct Runner
{
    std::string first_name, last_name, club;
    std::vector<double> times;
};

bool operator<(const Runner &left, const Runner &right);

std::ostream &operator<<(std::ostream &os, const Runner &runner);