#ifndef __GAME_H__
#define __GAME_H__

#include "main.h"

class GameEngine
{
public:
  GameEngine();
  virtual ~GameEngine();

  void InitGame(std::string szGameName, int nWidth, int nHeight);
  int Run();

  bool m_bInitialized = false;
  bool m_bRunning = false;

private:

  sf::RenderWindow m_Window;

  std::string m_szGameTitle;
  int m_nWidth;
  int m_nHeight;

};

#endif // __GAME_H__
