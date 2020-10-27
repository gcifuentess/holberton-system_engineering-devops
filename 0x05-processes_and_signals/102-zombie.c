#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int infinite_while(void);

/**
 * main - creates zombie process
 *
 * Return: Always 0
 */
int main(void)
{
	pid_t child_id;
	int count;

	count = 0;

	while (count < 5)
	{
		child_id = fork();
		if (child_id == 0)
		{
			break;
		}
		else
		{
			printf("Zombie process created, PID: %d\n", child_id);
			count++;
		}
	}
	if (child_id > 0)
		infinite_while();

	return (EXIT_SUCCESS);
}

/**
 * infinite_while - infinite loop
 *
 * Return: Always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
