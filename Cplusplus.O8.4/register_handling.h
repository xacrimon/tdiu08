#pragma once

#include <vector>

#include "hero_handling.h"

using Register_Type = std::vector<Hero_Type>;

void load_file(Register_Type &reg, std::string const &file_path);
void save_file(Register_Type &reg, std::string const &file_path);

void add_hero(Register_Type &reg,
              Hero_Type const &hero);

bool is_in_reg(Register_Type &reg,
               Hero_Type const &hero);

Register_Type match(Register_Type const &reg,
                    std::vector<int> const &interests);

std::ostream &operator<<(std::ostream &os, Register_Type const &reg);
