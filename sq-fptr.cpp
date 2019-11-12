using square_t = int(*)(int);

int square(int num) {
  return num * num;
}

square_t get_square() {
  return square;
}
