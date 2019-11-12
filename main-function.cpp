#include <functional>

using square_t = std::function<int(int)>;

square_t get_square();

int main()
{
  auto square = get_square();

  return square(5) + square(10);
}
