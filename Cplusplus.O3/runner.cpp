#include "runner.h"

#include <iomanip>

bool operator<(Runner_Type const &left, Runner_Type const &right)
{
    return left.times.at(0) < right.times.at(0);
}

std::ostream &operator<<(std::ostream &os, Runner_Type const &runner)
{
    os << std::setw(9) << runner.last_name;
    os << std::setw(10) << runner.first_name;
    os << std::setw(16) << runner.club << ":";
    for (double time : runner.times)
        os << " " << std::fixed << std::setprecision(2) << time;
    return os;
}