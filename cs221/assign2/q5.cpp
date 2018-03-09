class LegoMov {
  public:
    bool *evIsAwes;
    void setEvIsAwes(bool b) { *evIsAwes = b;}
    LegoMov() { evIsAwes = new bool(false); }
};

int main(void) {
    LegoMov movie;
    movie.setEvIsAwes(true);
    return 0;
}
