#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

/**
 * infinite_while - Aux function
 *
 * Description: This function waits the program infinitely
 *
 * Return: (int) 0 Success Always
 */
int infinite_while(void)
{
	while (1)
		sleep(1);
	return (0);
}

/**
 * main - Entry point
 *
 * Description: This is the entry point
 *
 * Return: (int) 0 Success Always
 */
int main(void)
{
	pid_t pid;
	int i = 5;

	while (i > 0)
	{
		pid = fork();

		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", (int)pid);
			sleep(1);
			i--;
		}
		else
			exit(0);
	}
	infinite_while();
	return (0);
}
