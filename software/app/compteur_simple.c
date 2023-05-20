#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"

int main(){
	while(1){
		for (int i = 0; i < 9; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				for (int k = 0; k < 9; k++)
				{
					IOWR_ALTERA_AVALON_PIO_DATA(SEG_BASE,k);
					usleep(100000);
				}
				IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE,j);
				usleep(100000);
			}
			IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE,i);
			usleep(100000);
        }
	}
		
	return 0;		
}
