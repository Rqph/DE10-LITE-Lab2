#include <system.h>
#include <altera_avalon_pio_regs.h>
#include <sys/alt_stdio.h>
#include <sys/alt_irq.h>
#include <alt_types.h>
#include <io.h>
#include <unistd.h>
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_sys_init.h"

int time = 0;


void split_time(int time){
	int i =0;
	int split[3] = {0,0,0};

	while (time >= 10) {
		split[i] = time % 10;
		time = time / 10;
		i = i+1;
	}
	split[i] = time;

	IOWR_ALTERA_AVALON_PIO_DATA(SEG_BASE,split[0]);
	IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE,split[1]);
	IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE,split[2]);

}



static void handle_timer_interrupt(void *context){
	
	if (time == 999) time = 0;
	else {
		split_time(time);
		time += 1;
	}
	
	alt_printf("INTERRUPT timer\n");
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);
}


int main(){
	alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,TIMER_0_IRQ, handle_timer_interrupt,NULL, NULL);
	
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x7);
	while(1){
	}
		
	return 0;		
}
