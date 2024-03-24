#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int infinite_while(void)
{
    while (1)
    {
        sleep(1);
    }
    return (0);
}

int main(void)
{
	pid_t pid;

	pid = fork();

	if (pid == 0)
	{
		printf("I am the chile\n");
		execl("/bin/ls", "ls", NULL);
	}
	else if (pid > 0)
	{
		printf("I am the parent and I'm waiting\n");
		sleep(30);
	}
	else
		printf("Error occured\n");
		
	return (0);
}

		

