#include <stdint.h>

void PUT32(unsigned int, unsigned int);

#define UART0_BASE 0x40004000
#define UARTDR (*((volatile uint32_t *)(UART0_BASE)))
#define UARTFR (*((volatile uint32_t *)(UART0_BASE + 0x18)))
#define UARTCR (*((volatile uint32_t *)(UART0_BASE + 0x30)))
#define UARTIBRD (*((volatile uint32_t *)(UART0_BASE + 0x24)))
#define UARTFBRD (*((volatile uint32_t *)(UART0_BASE + 0x28)))
#define UARTLCR_H (*((volatile uint32_t *)(UART0_BASE + 0x2C)))

#define UARTFR_TXFF (1 << 5) // Transmit FIFO full

void uart0_send_char(char c)
{
    while (UARTFR & UARTFR_TXFF)
    {
        __asm__ volatile("nop");
    }
    UARTDR = c;
}

void uart0_send_string(const char *str)
{
    while (*str)
    {
        uart0_send_char(*str++);
    }
}

void uart0_init(void)
{
    UARTCR = 0x0;                     // Disable UART
    UARTIBRD = 13;                    // Integer baud rate (e.g., 115200 @ 50MHz)
    UARTFBRD = 36;                    // Fractional baud rate
    UARTLCR_H = (3 << 5);             // 8N1: 8-bit, no parity, 1 stop
    UARTCR = (1 << 9) | (1 << 8) | 1; // TXE | RXE | UARTEN
}

int notmain(void)
{
    uart0_init();
    unsigned int rx;
    for (rx = 0; rx < 8; rx++)
    {
        // PUT32(UART_0BASE + 0x00, 0x30 + (rx & 7));
        uart0_send_string("Hejka naklejka\r\n");
    }
    while (1)
    {
        __asm__ volatile("nop");
    }
    return (0);
}
