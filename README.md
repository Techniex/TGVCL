# TGVCL
Techniex Generic VHDL Code Library

## Files

### fdre.vhd
Rising edge D-Flip Flop with multiple options to generate final implementation

Mode | g_ISSR | g_SRMODE | g_ISCLKEN | g_ISSET | g_ISSRHIGH | g_ISCLKENHIGH
---|---|---|---|---|---|---
synchronous active high set with active high clock enable | 'yes' | 'sync' | 'yes' | '1' | '1' | '1'|

1. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '1') synchronous active high set with active high clock enable.
2. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '0') synchronous active high set with active low clock enable.
3. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '1') synchronous active low set with active high clock enable.
4. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '0') synchronous active low set with active low clock enable.
5. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '1') synchronous active high reset with active high clock enable.
6. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '0') synchronous active high reset with active low clock enable.
7. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '1') synchronous active low reset with active high clock enable.
8. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '0') synchronous active low reset with active low clock enable. 
9. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "no" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = 'x') synchronous active high set.
10. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "no" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = 'x') synchronous active low set.
11. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "no" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = 'x') synchronous active high reset.
12. (g_ISSR = "yes" , g_SRMODE = "sync" , g_ISCLKEN = "no" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = 'x') synchronous active low reset.
13. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '1') asynchronous active high set with active high clock enable.
14. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '0') asynchronous active high set with active low clock enable.
15. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '1') asynchronous active low set with active high clock enable.
16. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '0') asynchronous active low set with active low clock enable.
17. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '1') asynchronous active high reset with active high clock enable.
18. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = '0') asynchronous active high reset with active low clock enable.
19. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '1') asynchronous active low reset with active high clock enable.
20. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "yes" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = '0') asynchronous active low reset with active low clock enable. 
21. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "no" , g_ISSET = '1' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = 'x') asynchronous active high set.
22. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "no" , g_ISSET = '1' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = 'x') asynchronous active low set.
23. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "no" , g_ISSET = '0' , g_ISSRHIGH = '1' , g_ISCLKENHIGH = 'x') asynchronous active high reset.
24. (g_ISSR = "yes" , g_SRMODE = "async" , g_ISCLKEN = "no" , g_ISSET = '0' , g_ISSRHIGH = '0' , g_ISCLKENHIGH = 'x') asynchronous active low reset.
25. (g_ISSR = "no" , g_SRMODE = "x" , g_ISCLKEN = "yes" , g_ISSET = 'x' , g_ISSRHIGH = 'x' , g_ISCLKENHIGH = '1') active high clock enable.
26. (g_ISSR = "no" , g_SRMODE = "x" , g_ISCLKEN = "yes" , g_ISSET = 'x' , g_ISSRHIGH = 'x' , g_ISCLKENHIGH = '0') active low clock enable.
27. (g_ISSR = "no" , g_SRMODE = "x" , g_ISCLKEN = "no" , g_ISSET = 'x' , g_ISSRHIGH = 'x' , g_ISCLKENHIGH = 'x') simple D flip flop.

