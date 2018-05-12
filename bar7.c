#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>

int main()
{
	system("clear");
	
	struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    
    int barWidth = w.ws_col - 10;

   	float progress = 0.0;
   	
	while (progress < 1.0) {
	    printf("\r%3d%% ", (int)(progress * 100.0));
	    int pos = barWidth * progress;
	    for (int i = 0; i < barWidth; i++) {
	        if (i <= pos) printf("\u258A");
	        else printf(" ");
	    }
	    fflush(stdout);
	
	    progress += 0.02; // test
	    
	    usleep(100000);
	}
	printf("\r100%%\n");
	
	return 0;
	
}