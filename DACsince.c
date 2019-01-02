#include <lpc214x.h> / if in local folder use "lpc214x.h"
#include <stdint.h>

//Sin = 512 + (511*sin((360*n)/42))

void delay_ms(uint16_t j)
{
    uint16_t x,i;
    for(i=0;i<j;i++)
    {
    for(x=0; x<6000; x++);    /* loop to generate 1 ms
                                                 delay with Cclk = 60MHz */
     }
}
int main (void)
{
  uint16_t value;
   uint8_t i;
   i = 0;
   PINSEL1 = 0x00080000;	/* P0.25 as DAC output */
   IO0DIR = 0xFFFFFFFF; 	
uint16_t sin_wave[] = { 512,591,665,742,808,873,926,968,998,1017,1023,1017,998,968,926,873,808,742,665,591,512,436,359,282,216,211,151,97,55,25,6,0,6,25,55,97,151,211,216,282,359,436 };
while(1)
	{
while(i !=42)     /* number of points*/
{
	value = sin_wave[i]*50;
	DACR = value;					delay_ms(1);
	i++;
	}
	i = 0;
}
}
