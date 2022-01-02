#include "game.h"

// Constructor / Deconstructor
GameEngine::GameEngine()
{
  printf("Creating game engine interface...");
  m_bInitialized = false;
  m_bRunning = false;
  m_szGameTitle = "N/A";
  m_nWidth = 100;
  m_nHeight = 100;
}

GameEngine::~GameEngine()
{

}

void GameEngine::InitGame(std::string szTitle, int width, int height)
{
  std::cout << "Initializing Game Engine..." << std::endl;

  std::cout << "Creating Game Engine window..." << std::endl;
  m_szGameTitle = szTitle;
  m_nWidth = width;
  m_nHeight = height;
  sf::RenderWindow m_Window(sf::VideoMode(m_nWidth, m_nHeight), m_szGameTitle);

  //m_Window.clear(sf::Color::White);
  //m_Window.display();

  if(m_Window.isOpen()){
    m_bInitialized = true;
    std::cout << "Title: " << m_szGameTitle << " - " << m_nWidth << "x" << m_nHeight << std::endl;
    std::cout << "Game engine window created succesfully!" << std::endl;
  }

  sf::Event event;
  while (m_Window.isOpen())
  {
    //nErrorCode = 0;
    while (m_Window.pollEvent(event))
    {
      switch(event.type){
        case sf::Event::Closed:
          m_Window.close();
          break;
        default:
          break;
      };

    }

    // Game Logic

    // Game Render
    m_Window.clear(sf::Color::White);


    m_Window.display();
  }

}

int GameEngine::Run()
{
  int nErrorCode = -1;
  sf::Event event;

  while (m_Window.isOpen())
  {
    nErrorCode = 0;
    while (m_Window.pollEvent(event))
    {
      switch(event.type){
        case sf::Event::Closed:
          m_Window.close();
          break;
        default:
          break;
      };

    }

    // Game Logic

    // Game Render
    m_Window.clear(sf::Color::White);


    m_Window.display();
  }

  return nErrorCode;
}
