# TGVCL
Techniex Generic VHDL Code Library

## Files

### fdre.vhd
Rising edge D-Flip Flop with multiple options to generate final implementation

Mode | g_ISSR | g_SRMODE | g_ISCLKEN | g_ISSET | g_ISSRHIGH | g_ISCLKENHIGH
---|---|---|---|---|---|---
synchronous active high set with active high clock enable | 'yes' | 'sync' | 'yes' | '1' | '1' | '1'
synchronous active high set with active low clock enable| 'yes' | 'sync' | 'yes' | '1' | '1' | '0'
synchronous active low set with active high clock enable| 'yes' | 'sync' | 'yes' | '1' | '0' | '1'
synchronous active low set with active low clock enable| 'yes' | 'sync' | 'yes' | '1' | '0' | '0'
synchronous active high reset with active high clock enable | 'yes' | 'sync' | 'yes' | '0' | '1' | '1'
synchronous active high reset with active low clock enable| 'yes' | 'sync' | 'yes' | '0' | '1' | '0'
synchronous active low reset with active high clock enable| 'yes' | 'sync' | 'yes' | '0' | '1' | '1'
synchronous active low reset with active low clock enable| 'yes' | 'sync' | 'yes' | '0' | '1' | '0'
synchronous active high set | 'yes' | 'sync' | 'no' | '1' | '1' | 'x'
synchronous active low set| 'yes' | 'sync' | 'yes' | '1' | '0' | 'x'
synchronous active high reset| 'yes' | 'sync' | 'yes' | '0' | '1' | 'x'
synchronous active low reset| 'yes' | 'sync' | 'yes' | '0' | '1' | 'x'
asynchronous active high set with active high clock enable | 'yes' | 'async' | 'yes' | '1' | '1' | '1'
asynchronous active high set with active low clock enable| 'yes' | 'async' | 'yes' | '1' | '1' | '0'
asynchronous active low set with active high clock enable| 'yes' | 'async' | 'yes' | '1' | '0' | '1'
asynchronous active low set with active low clock enable| 'yes' | 'async' | 'yes' | '1' | '0' | '0'
asynchronous active high reset with active high clock enable | 'yes' | 'async' | 'yes' | '0' | '1' | '1'
asynchronous active high reset with active low clock enable| 'yes' | 'async' | 'yes' | '0' | '1' | '0'
asynchronous active low reset with active high clock enable| 'yes' | 'async' | 'yes' | '0' | '1' | '1'
asynchronous active low reset with active low clock enable| 'yes' | 'async' | 'yes' | '0' | '1' | '0'
asynchronous active high set | 'yes' | 'async' | 'no' | '1' | '1' | 'x'
asynchronous active low set| 'yes' | 'async' | 'yes' | '1' | '0' | 'x'
asynchronous active high reset| 'yes' | 'async' | 'yes' | '0' | '1' | 'x'
asynchronous active low reset| 'yes' | 'async' | 'yes' | '0' | '1' | 'x'
active high clock enable| 'no' | 'x' | 'yes' | 'x' | 'x' | '1'
active low clock enable| 'no' | 'x' | 'yes' | 'x' | 'x' | '0'
simple D flip flop| 'no' | 'x' | 'no' | 'x' | 'x' | 'x'

