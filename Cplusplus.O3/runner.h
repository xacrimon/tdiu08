#pragma once

#include <ostream>
#include <string>
#include <vector>

struct Runner_Type
{
    std::string first_name, last_name, club;
    std::vector<double> times;
};

bool operator<(Runner_Type const &left, 
               Runner_Type const &right);

std::ostream &operator<<(std::ostream &os, 
                         Runner_Type const &runner);