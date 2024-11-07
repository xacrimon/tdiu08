#include <iostream>

void print_triangle(int size);

int main()
{
    int size;

    do
    {
        std::cout << "Enter size: ";
        std::cin >> size;

        if (size < 1)
            std::cout << "Need to be at least 1. ";
        else if (size % 2 == 0)
            std::cout << "Has to be uneven. ";
    } while (size < 1 || size % 2 == 0);

    print_triangle(size);
}

void print_triangle(int size)
{
    std::string line;

    for (int y = 0; y < size; y++)
    {
        if (y == size - 1)
        {
            for (int i = 0; i < size * 2 - 1; i++)
                line.push_back('*');
        }
        else
        {
            for (int i = 0; i < size * 2 - 1; i++)
                line.push_back('.');
            line.at(size - 1 - y) = '*';
            line.at(size - 1 + y) = '*';
        }

        std::cout << line << std::endl;
        line = "";
    }
}