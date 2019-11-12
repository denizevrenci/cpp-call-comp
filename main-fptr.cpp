using square_t = int(*)(int);

square_t get_square();

int main()
{
  auto square = get_square();

  return square(5) + square(10);
}
