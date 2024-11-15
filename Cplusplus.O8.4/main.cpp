#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <string>
#include <vector>

using namespace std;

typedef struct {
    std::string name;
    int birth_year;
    int weight;
    std::string hair_color;
    vector<int> interests;
} HeroEntry;

HeroEntry parse_from_stream(std::istream& stream) {
    HeroEntry entry {};
    return entry;
}

int main()
{
    return 0;
}
