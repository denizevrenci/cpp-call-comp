#include <functional>

using square_t = std::function<int(int)>;

int square(const int num)
{
  return num * num;
}

square_t get_square()
{
  return square;
}
