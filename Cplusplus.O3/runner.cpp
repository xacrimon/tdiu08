#include "runner.h"

#include <iomanip>

bool operator<(const Runner_Type &left, const Runner_Type &right)
{
    return left.times.at(0) < right.times.at(0);
}

std::ostream &operator<<(std::ostream &os, const Runner_Type &runner)
{
    os << std::setw(9) << runner.last_name;
    os << std::setw(10) << runner.first_name;
    os << std::setw(16) << runner.club << ":";
    for (double time : runner.times)
        os << " " << std::fixed << std::setprecision(2) << time;
    return os;
}