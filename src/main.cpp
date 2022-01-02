#include "main.h"
#include "physics.h"
#include "game.h"

int main(int argc, char* argv[]){
	printf("Starting SFML Game Engine...\n");

	PhysicsEngine* m_Engine = new PhysicsEngine();
	m_Engine->InitPhysics();

	GameEngine* m_Game = new GameEngine();
	m_Game->InitGame("My First Game", 640, 380);
	if(m_Game->m_bInitialized){
		int nExit = m_Game->Run();
		switch(nExit){
			case -1:

				break;

			default:
				break;
		};
	}


	return 0;
}
