#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/i2c-dev.h>
#include <i2c/smbus.h>

#define	I2C_FNAME	"/dev/i2c-2"
#define	SI5351_ADDR	0x60
#include "Si5351A-RevB-Registers.h"

int	i2c_file;

void i2c_init()
{
	i2c_file = open(I2C_FNAME, O_RDWR);
	if (i2c_file < 0)
		exit(1);
}

int i2c_read(unsigned char reg)
{
	if (ioctl(i2c_file, I2C_SLAVE, SI5351_ADDR) < 0) 
		exit(1);

	int res;

	/* Using SMBus commands */
	res = i2c_smbus_read_byte_data(i2c_file, reg);
	if (res < 0) 
		exit(1);
	else 
		printf("r dev(0x%x) reg(0x%x)=0x%x\n", SI5351_ADDR, reg, res);
	return res;
}

int i2c_write(unsigned char reg, unsigned char value){
	if(ioctl(i2c_file, I2C_SLAVE, SI5351_ADDR)<0){
		printf("no\n");
		exit(1);
	
	}
	char res;
	res = i2c_smbus_write_byte_data(i2c_file, reg, value);
	if (res < 0){
		printf("Error\n");
		exit(1);
	}
	else {
		printf("w dev(0x%x) reg(0x%x)=0x%x\n", SI5351_ADDR, reg, value);
	}
	return res;


}


int main()
{
	i2c_init();
	i2c_read(0);
	i2c_write(3, 0xFF);
	for (unsigned char i = 16; i <24; i++){
		i2c_write(i, 0x80);
	}
	i2c_write(2, 0x53); 
	i2c_read(183);
	for (int i = 0 ; i< SI5351A_REVB_REG_CONFIG_NUM_REGS; i++){
		if ((si5351a_revb_registers[i].address >= 15 &&  si5351a_revb_registers[i].address <= 92) || (si5351a_revb_registers[i].address >= 149 &&  si5351a_revb_registers[i].address <= 170)){
		i2c_write((unsigned char) si5351a_revb_registers[i].address , (unsigned char)si5351a_revb_registers[i].value);
		}
	}
	i2c_write(177, 0xAC);
	i2c_write(3, 0xFC);

}
