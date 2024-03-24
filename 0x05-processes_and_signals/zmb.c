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

	int i = 0;
	while (i < 5)
	{
		pid = fork();
		if (pid == 0)
			continue;
		else
			printf("The pid from fork is [%d] is: \n", (int)pid);
		i++;
	}
	infinite_while();
    return (0);
}

