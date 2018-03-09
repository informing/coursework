
alloc:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x213>
  400248:	78 38                	js     400282 <_init-0x206>
  40024a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
  400250:	6f                   	outsl  %ds:(%rsi),(%dx)
  400251:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.ABI-tag:

0000000000400254 <.note.ABI-tag>:
  400254:	04 00                	add    $0x0,%al
  400256:	00 00                	add    %al,(%rax)
  400258:	10 00                	adc    %al,(%rax)
  40025a:	00 00                	add    %al,(%rax)
  40025c:	01 00                	add    %eax,(%rax)
  40025e:	00 00                	add    %al,(%rax)
  400260:	47                   	rex.RXB
  400261:	4e 55                	rex.WRX push %rbp
  400263:	00 00                	add    %al,(%rax)
  400265:	00 00                	add    %al,(%rax)
  400267:	00 02                	add    %al,(%rdx)
  400269:	00 00                	add    %al,(%rax)
  40026b:	00 06                	add    %al,(%rsi)
  40026d:	00 00                	add    %al,(%rax)
  40026f:	00 20                	add    %ah,(%rax)
  400271:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000400274 <.note.gnu.build-id>:
  400274:	04 00                	add    $0x0,%al
  400276:	00 00                	add    %al,(%rax)
  400278:	14 00                	adc    $0x0,%al
  40027a:	00 00                	add    %al,(%rax)
  40027c:	03 00                	add    (%rax),%eax
  40027e:	00 00                	add    %al,(%rax)
  400280:	47                   	rex.RXB
  400281:	4e 55                	rex.WRX push %rbp
  400283:	00 e8                	add    %ch,%al
  400285:	ae                   	scas   %es:(%rdi),%al
  400286:	cd de                	int    $0xde
  400288:	8f                   	(bad)  
  400289:	dc a8 b2 df d5 00    	fsubrl 0xd5dfb2(%rax)
  40028f:	a9 e4 7e 6c 70       	test   $0x706c7ee4,%eax
  400294:	58                   	pop    %rax
  400295:	77 4f                	ja     4002e6 <_init-0x1a2>
  400297:	37                   	(bad)  

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	01 00                	add    %eax,(%rax)
  40029a:	00 00                	add    %al,(%rax)
  40029c:	01 00                	add    %eax,(%rax)
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .dynsym:

00000000004002b8 <.dynsym>:
	...
  4002d0:	10 00                	adc    %al,(%rax)
  4002d2:	00 00                	add    %al,(%rax)
  4002d4:	20 00                	and    %al,(%rax)
	...
  4002e6:	00 00                	add    %al,(%rax)
  4002e8:	1f                   	(bad)  
  4002e9:	00 00                	add    %al,(%rax)
  4002eb:	00 20                	add    %ah,(%rax)
	...
  4002fd:	00 00                	add    %al,(%rax)
  4002ff:	00 8b 00 00 00 12    	add    %cl,0x12000000(%rbx)
	...
  400315:	00 00                	add    %al,(%rax)
  400317:	00 92 00 00 00 12    	add    %dl,0x12000000(%rdx)
	...
  40032d:	00 00                	add    %al,(%rax)
  40032f:	00 33                	add    %dh,(%rbx)
  400331:	00 00                	add    %al,(%rax)
  400333:	00 20                	add    %ah,(%rax)
	...
  400345:	00 00                	add    %al,(%rax)
  400347:	00 4f 00             	add    %cl,0x0(%rdi)
  40034a:	00 00                	add    %al,(%rax)
  40034c:	20 00                	and    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000400360 <.dynstr>:
  400360:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  400364:	73 74                	jae    4003da <_init-0xae>
  400366:	64 63 2b             	movslq %fs:(%rbx),%ebp
  400369:	2b 2e                	sub    (%rsi),%ebp
  40036b:	73 6f                	jae    4003dc <_init-0xac>
  40036d:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%rdi)
  400372:	67 6d                	insl   (%dx),%es:(%edi)
  400374:	6f                   	outsl  %ds:(%rsi),(%dx)
  400375:	6e                   	outsb  %ds:(%rsi),(%dx)
  400376:	5f                   	pop    %rdi
  400377:	73 74                	jae    4003ed <_init-0x9b>
  400379:	61                   	(bad)  
  40037a:	72 74                	jb     4003f0 <_init-0x98>
  40037c:	5f                   	pop    %rdi
  40037d:	5f                   	pop    %rdi
  40037e:	00 5f 4a             	add    %bl,0x4a(%rdi)
  400381:	76 5f                	jbe    4003e2 <_init-0xa6>
  400383:	52                   	push   %rdx
  400384:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%ebx),%esi
  40038b:	43 6c 
  40038d:	61                   	(bad)  
  40038e:	73 73                	jae    400403 <_init-0x85>
  400390:	65 73 00             	gs jae 400393 <_init-0xf5>
  400393:	5f                   	pop    %rdi
  400394:	49 54                	rex.WB push %r12
  400396:	4d 5f                	rex.WRB pop %r15
  400398:	64 65 72 65          	fs gs jb 400401 <_init-0x87>
  40039c:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  4003a3:	4d 
  4003a4:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  4003a6:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003a7:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003a8:	65 54                	gs push %rsp
  4003aa:	61                   	(bad)  
  4003ab:	62                   	(bad)  
  4003ac:	6c                   	insb   (%dx),%es:(%rdi)
  4003ad:	65 00 5f 49          	add    %bl,%gs:0x49(%rdi)
  4003b1:	54                   	push   %rsp
  4003b2:	4d 5f                	rex.WRB pop %r15
  4003b4:	72 65                	jb     40041b <_init-0x6d>
  4003b6:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  4003bd:	4d 
  4003be:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  4003c0:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003c1:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003c2:	65 54                	gs push %rsp
  4003c4:	61                   	(bad)  
  4003c5:	62                   	(bad)  
  4003c6:	6c                   	insb   (%dx),%es:(%rdi)
  4003c7:	65 00 6c 69 62       	add    %ch,%gs:0x62(%rcx,%rbp,2)
  4003cc:	6d                   	insl   (%dx),%es:(%rdi)
  4003cd:	2e 73 6f             	jae,pn 40043f <_init-0x49>
  4003d0:	2e 36 00 6c 69 62    	cs add %ch,%ss:0x62(%rcx,%rbp,2)
  4003d6:	67 63 63 5f          	movslq 0x5f(%ebx),%esp
  4003da:	73 2e                	jae    40040a <_init-0x7e>
  4003dc:	73 6f                	jae    40044d <_init-0x3b>
  4003de:	2e 31 00             	xor    %eax,%cs:(%rax)
  4003e1:	6c                   	insb   (%dx),%es:(%rdi)
  4003e2:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%rdx),%esp
  4003e9:	36 00 6d 61          	add    %ch,%ss:0x61(%rbp)
  4003ed:	6c                   	insb   (%dx),%es:(%rdi)
  4003ee:	6c                   	insb   (%dx),%es:(%rdi)
  4003ef:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003f0:	63 00                	movslq (%rax),%eax
  4003f2:	5f                   	pop    %rdi
  4003f3:	5f                   	pop    %rdi
  4003f4:	6c                   	insb   (%dx),%es:(%rdi)
  4003f5:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  4003fc:	72 74                	jb     400472 <_init-0x16>
  4003fe:	5f                   	pop    %rdi
  4003ff:	6d                   	insl   (%dx),%es:(%rdi)
  400400:	61                   	(bad)  
  400401:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
  400408:	43 5f                	rex.XB pop %r15
  40040a:	32 2e                	xor    (%rsi),%ch
  40040c:	32 2e                	xor    (%rsi),%ch
  40040e:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

0000000000400410 <.gnu.version>:
  400410:	00 00                	add    %al,(%rax)
  400412:	00 00                	add    %al,(%rax)
  400414:	00 00                	add    %al,(%rax)
  400416:	02 00                	add    (%rax),%al
  400418:	02 00                	add    (%rax),%al
  40041a:	00 00                	add    %al,(%rax)
	...

Disassembly of section .gnu.version_r:

0000000000400420 <.gnu.version_r>:
  400420:	01 00                	add    %eax,(%rax)
  400422:	01 00                	add    %eax,(%rax)
  400424:	81 00 00 00 10 00    	addl   $0x100000,(%rax)
  40042a:	00 00                	add    %al,(%rax)
  40042c:	00 00                	add    %al,(%rax)
  40042e:	00 00                	add    %al,(%rax)
  400430:	75 1a                	jne    40044c <_init-0x3c>
  400432:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  400438:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  400439:	00 00                	add    %al,(%rax)
  40043b:	00 00                	add    %al,(%rax)
  40043d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000400440 <.rela.dyn>:
  400440:	f8                   	clc    
  400441:	0f 60 00             	punpcklbw (%rax),%mm0
  400444:	00 00                	add    %al,(%rax)
  400446:	00 00                	add    %al,(%rax)
  400448:	06                   	(bad)  
  400449:	00 00                	add    %al,(%rax)
  40044b:	00 01                	add    %al,(%rcx)
	...

Disassembly of section .rela.plt:

0000000000400458 <.rela.plt>:
  400458:	18 10                	sbb    %dl,(%rax)
  40045a:	60                   	(bad)  
  40045b:	00 00                	add    %al,(%rax)
  40045d:	00 00                	add    %al,(%rax)
  40045f:	00 07                	add    %al,(%rdi)
  400461:	00 00                	add    %al,(%rax)
  400463:	00 03                	add    %al,(%rbx)
	...
  40046d:	00 00                	add    %al,(%rax)
  40046f:	00 20                	add    %ah,(%rax)
  400471:	10 60 00             	adc    %ah,0x0(%rax)
  400474:	00 00                	add    %al,(%rax)
  400476:	00 00                	add    %al,(%rax)
  400478:	07                   	(bad)  
  400479:	00 00                	add    %al,(%rax)
  40047b:	00 04 00             	add    %al,(%rax,%rax,1)
	...

Disassembly of section .init:

0000000000400488 <_init>:
  400488:	48 83 ec 08          	sub    $0x8,%rsp
  40048c:	48 8b 05 65 0b 20 00 	mov    0x200b65(%rip),%rax        # 600ff8 <_DYNAMIC+0x200>
  400493:	48 85 c0             	test   %rax,%rax
  400496:	74 05                	je     40049d <_init+0x15>
  400498:	e8 43 00 00 00       	callq  4004e0 <__libc_start_main@plt+0x10>
  40049d:	48 83 c4 08          	add    $0x8,%rsp
  4004a1:	c3                   	retq   

Disassembly of section .plt:

00000000004004b0 <malloc@plt-0x10>:
  4004b0:	ff 35 52 0b 20 00    	pushq  0x200b52(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004b6:	ff 25 54 0b 20 00    	jmpq   *0x200b54(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004c0 <malloc@plt>:
  4004c0:	ff 25 52 0b 20 00    	jmpq   *0x200b52(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4004c6:	68 00 00 00 00       	pushq  $0x0
  4004cb:	e9 e0 ff ff ff       	jmpq   4004b0 <_init+0x28>

00000000004004d0 <__libc_start_main@plt>:
  4004d0:	ff 25 4a 0b 20 00    	jmpq   *0x200b4a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4004d6:	68 01 00 00 00       	pushq  $0x1
  4004db:	e9 d0 ff ff ff       	jmpq   4004b0 <_init+0x28>

Disassembly of section .plt.got:

00000000004004e0 <.plt.got>:
  4004e0:	ff 25 12 0b 20 00    	jmpq   *0x200b12(%rip)        # 600ff8 <_DYNAMIC+0x200>
  4004e6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004004f0 <_start>:
  4004f0:	31 ed                	xor    %ebp,%ebp
  4004f2:	49 89 d1             	mov    %rdx,%r9
  4004f5:	5e                   	pop    %rsi
  4004f6:	48 89 e2             	mov    %rsp,%rdx
  4004f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004fd:	50                   	push   %rax
  4004fe:	54                   	push   %rsp
  4004ff:	49 c7 c0 80 06 40 00 	mov    $0x400680,%r8
  400506:	48 c7 c1 10 06 40 00 	mov    $0x400610,%rcx
  40050d:	48 c7 c7 e6 05 40 00 	mov    $0x4005e6,%rdi
  400514:	e8 b7 ff ff ff       	callq  4004d0 <__libc_start_main@plt>
  400519:	f4                   	hlt    
  40051a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400520 <deregister_tm_clones>:
  400520:	b8 37 10 60 00       	mov    $0x601037,%eax
  400525:	55                   	push   %rbp
  400526:	48 2d 30 10 60 00    	sub    $0x601030,%rax
  40052c:	48 83 f8 0e          	cmp    $0xe,%rax
  400530:	48 89 e5             	mov    %rsp,%rbp
  400533:	76 1b                	jbe    400550 <deregister_tm_clones+0x30>
  400535:	b8 00 00 00 00       	mov    $0x0,%eax
  40053a:	48 85 c0             	test   %rax,%rax
  40053d:	74 11                	je     400550 <deregister_tm_clones+0x30>
  40053f:	5d                   	pop    %rbp
  400540:	bf 30 10 60 00       	mov    $0x601030,%edi
  400545:	ff e0                	jmpq   *%rax
  400547:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40054e:	00 00 
  400550:	5d                   	pop    %rbp
  400551:	c3                   	retq   
  400552:	0f 1f 40 00          	nopl   0x0(%rax)
  400556:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40055d:	00 00 00 

0000000000400560 <register_tm_clones>:
  400560:	be 30 10 60 00       	mov    $0x601030,%esi
  400565:	55                   	push   %rbp
  400566:	48 81 ee 30 10 60 00 	sub    $0x601030,%rsi
  40056d:	48 c1 fe 03          	sar    $0x3,%rsi
  400571:	48 89 e5             	mov    %rsp,%rbp
  400574:	48 89 f0             	mov    %rsi,%rax
  400577:	48 c1 e8 3f          	shr    $0x3f,%rax
  40057b:	48 01 c6             	add    %rax,%rsi
  40057e:	48 d1 fe             	sar    %rsi
  400581:	74 15                	je     400598 <register_tm_clones+0x38>
  400583:	b8 00 00 00 00       	mov    $0x0,%eax
  400588:	48 85 c0             	test   %rax,%rax
  40058b:	74 0b                	je     400598 <register_tm_clones+0x38>
  40058d:	5d                   	pop    %rbp
  40058e:	bf 30 10 60 00       	mov    $0x601030,%edi
  400593:	ff e0                	jmpq   *%rax
  400595:	0f 1f 00             	nopl   (%rax)
  400598:	5d                   	pop    %rbp
  400599:	c3                   	retq   
  40059a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005a0 <__do_global_dtors_aux>:
  4005a0:	80 3d 85 0a 20 00 00 	cmpb   $0x0,0x200a85(%rip)        # 60102c <_edata>
  4005a7:	75 11                	jne    4005ba <__do_global_dtors_aux+0x1a>
  4005a9:	55                   	push   %rbp
  4005aa:	48 89 e5             	mov    %rsp,%rbp
  4005ad:	e8 6e ff ff ff       	callq  400520 <deregister_tm_clones>
  4005b2:	5d                   	pop    %rbp
  4005b3:	c6 05 72 0a 20 00 01 	movb   $0x1,0x200a72(%rip)        # 60102c <_edata>
  4005ba:	f3 c3                	repz retq 
  4005bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005c0 <frame_dummy>:
  4005c0:	bf f0 0d 60 00       	mov    $0x600df0,%edi
  4005c5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4005c9:	75 05                	jne    4005d0 <frame_dummy+0x10>
  4005cb:	eb 93                	jmp    400560 <register_tm_clones>
  4005cd:	0f 1f 00             	nopl   (%rax)
  4005d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4005d5:	48 85 c0             	test   %rax,%rax
  4005d8:	74 f1                	je     4005cb <frame_dummy+0xb>
  4005da:	55                   	push   %rbp
  4005db:	48 89 e5             	mov    %rsp,%rbp
  4005de:	ff d0                	callq  *%rax
  4005e0:	5d                   	pop    %rbp
  4005e1:	e9 7a ff ff ff       	jmpq   400560 <register_tm_clones>

00000000004005e6 <main>:
  4005e6:	55                   	push   %rbp
  4005e7:	48 89 e5             	mov    %rsp,%rbp
  4005ea:	48 83 ec 10          	sub    $0x10,%rsp
  4005ee:	bf 04 00 00 00       	mov    $0x4,%edi
  4005f3:	e8 c8 fe ff ff       	callq  4004c0 <malloc@plt>
  4005f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4005fc:	b8 00 00 00 00       	mov    $0x0,%eax
  400601:	c9                   	leaveq 
  400602:	c3                   	retq   
  400603:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40060a:	00 00 00 
  40060d:	0f 1f 00             	nopl   (%rax)

0000000000400610 <__libc_csu_init>:
  400610:	41 57                	push   %r15
  400612:	41 56                	push   %r14
  400614:	41 89 ff             	mov    %edi,%r15d
  400617:	41 55                	push   %r13
  400619:	41 54                	push   %r12
  40061b:	4c 8d 25 be 07 20 00 	lea    0x2007be(%rip),%r12        # 600de0 <__frame_dummy_init_array_entry>
  400622:	55                   	push   %rbp
  400623:	48 8d 2d be 07 20 00 	lea    0x2007be(%rip),%rbp        # 600de8 <__init_array_end>
  40062a:	53                   	push   %rbx
  40062b:	49 89 f6             	mov    %rsi,%r14
  40062e:	49 89 d5             	mov    %rdx,%r13
  400631:	4c 29 e5             	sub    %r12,%rbp
  400634:	48 83 ec 08          	sub    $0x8,%rsp
  400638:	48 c1 fd 03          	sar    $0x3,%rbp
  40063c:	e8 47 fe ff ff       	callq  400488 <_init>
  400641:	48 85 ed             	test   %rbp,%rbp
  400644:	74 20                	je     400666 <__libc_csu_init+0x56>
  400646:	31 db                	xor    %ebx,%ebx
  400648:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40064f:	00 
  400650:	4c 89 ea             	mov    %r13,%rdx
  400653:	4c 89 f6             	mov    %r14,%rsi
  400656:	44 89 ff             	mov    %r15d,%edi
  400659:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40065d:	48 83 c3 01          	add    $0x1,%rbx
  400661:	48 39 dd             	cmp    %rbx,%rbp
  400664:	75 ea                	jne    400650 <__libc_csu_init+0x40>
  400666:	48 83 c4 08          	add    $0x8,%rsp
  40066a:	5b                   	pop    %rbx
  40066b:	5d                   	pop    %rbp
  40066c:	41 5c                	pop    %r12
  40066e:	41 5d                	pop    %r13
  400670:	41 5e                	pop    %r14
  400672:	41 5f                	pop    %r15
  400674:	c3                   	retq   
  400675:	90                   	nop
  400676:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40067d:	00 00 00 

0000000000400680 <__libc_csu_fini>:
  400680:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400684 <_fini>:
  400684:	48 83 ec 08          	sub    $0x8,%rsp
  400688:	48 83 c4 08          	add    $0x8,%rsp
  40068c:	c3                   	retq   

Disassembly of section .rodata:

0000000000400690 <_IO_stdin_used>:
  400690:	01 00                	add    %eax,(%rax)
  400692:	02 00                	add    (%rax),%al
  400694:	00 00                	add    %al,(%rax)
	...

0000000000400698 <__dso_handle>:
	...

Disassembly of section .eh_frame_hdr:

00000000004006a0 <__GNU_EH_FRAME_HDR>:
  4006a0:	01 1b                	add    %ebx,(%rbx)
  4006a2:	03 3b                	add    (%rbx),%edi
  4006a4:	34 00                	xor    $0x0,%al
  4006a6:	00 00                	add    %al,(%rax)
  4006a8:	05 00 00 00 10       	add    $0x10000000,%eax
  4006ad:	fe                   	(bad)  
  4006ae:	ff                   	(bad)  
  4006af:	ff 80 00 00 00 50    	incl   0x50000000(%rax)
  4006b5:	fe                   	(bad)  
  4006b6:	ff                   	(bad)  
  4006b7:	ff 50 00             	callq  *0x0(%rax)
  4006ba:	00 00                	add    %al,(%rax)
  4006bc:	46 ff                	rex.RX (bad) 
  4006be:	ff                   	(bad)  
  4006bf:	ff a8 00 00 00 70    	ljmp   *0x70000000(%rax)
  4006c5:	ff                   	(bad)  
  4006c6:	ff                   	(bad)  
  4006c7:	ff c8                	dec    %eax
  4006c9:	00 00                	add    %al,(%rax)
  4006cb:	00 e0                	add    %ah,%al
  4006cd:	ff                   	(bad)  
  4006ce:	ff                   	(bad)  
  4006cf:	ff 10                	callq  *(%rax)
  4006d1:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .eh_frame:

00000000004006d8 <__FRAME_END__-0xf0>:
  4006d8:	14 00                	adc    $0x0,%al
  4006da:	00 00                	add    %al,(%rax)
  4006dc:	00 00                	add    %al,(%rax)
  4006de:	00 00                	add    %al,(%rax)
  4006e0:	01 7a 52             	add    %edi,0x52(%rdx)
  4006e3:	00 01                	add    %al,(%rcx)
  4006e5:	78 10                	js     4006f7 <__GNU_EH_FRAME_HDR+0x57>
  4006e7:	01 1b                	add    %ebx,(%rbx)
  4006e9:	0c 07                	or     $0x7,%al
  4006eb:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  4006f1:	00 00                	add    %al,(%rax)
  4006f3:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4006f6:	00 00                	add    %al,(%rax)
  4006f8:	f8                   	clc    
  4006f9:	fd                   	std    
  4006fa:	ff                   	(bad)  
  4006fb:	ff 2a                	ljmp   *(%rdx)
	...
  400705:	00 00                	add    %al,(%rax)
  400707:	00 14 00             	add    %dl,(%rax,%rax,1)
  40070a:	00 00                	add    %al,(%rax)
  40070c:	00 00                	add    %al,(%rax)
  40070e:	00 00                	add    %al,(%rax)
  400710:	01 7a 52             	add    %edi,0x52(%rdx)
  400713:	00 01                	add    %al,(%rcx)
  400715:	78 10                	js     400727 <__GNU_EH_FRAME_HDR+0x87>
  400717:	01 1b                	add    %ebx,(%rbx)
  400719:	0c 07                	or     $0x7,%al
  40071b:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  400721:	00 00                	add    %al,(%rax)
  400723:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400726:	00 00                	add    %al,(%rax)
  400728:	88 fd                	mov    %bh,%ch
  40072a:	ff                   	(bad)  
  40072b:	ff 30                	pushq  (%rax)
  40072d:	00 00                	add    %al,(%rax)
  40072f:	00 00                	add    %al,(%rax)
  400731:	0e                   	(bad)  
  400732:	10 46 0e             	adc    %al,0xe(%rsi)
  400735:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400738:	0b 77 08             	or     0x8(%rdi),%esi
  40073b:	80 00 3f             	addb   $0x3f,(%rax)
  40073e:	1a 3b                	sbb    (%rbx),%bh
  400740:	2a 33                	sub    (%rbx),%dh
  400742:	24 22                	and    $0x22,%al
  400744:	00 00                	add    %al,(%rax)
  400746:	00 00                	add    %al,(%rax)
  400748:	1c 00                	sbb    $0x0,%al
  40074a:	00 00                	add    %al,(%rax)
  40074c:	44 00 00             	add    %r8b,(%rax)
  40074f:	00 96 fe ff ff 1d    	add    %dl,0x1dfffffe(%rsi)
  400755:	00 00                	add    %al,(%rax)
  400757:	00 00                	add    %al,(%rax)
  400759:	41 0e                	rex.B (bad) 
  40075b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400761:	58                   	pop    %rax
  400762:	0c 07                	or     $0x7,%al
  400764:	08 00                	or     %al,(%rax)
  400766:	00 00                	add    %al,(%rax)
  400768:	44 00 00             	add    %r8b,(%rax)
  40076b:	00 64 00 00          	add    %ah,0x0(%rax,%rax,1)
  40076f:	00 a0 fe ff ff 65    	add    %ah,0x65fffffe(%rax)
  400775:	00 00                	add    %al,(%rax)
  400777:	00 00                	add    %al,(%rax)
  400779:	42 0e                	rex.X (bad) 
  40077b:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  400781:	8e 03                	mov    (%rbx),%es
  400783:	45 0e                	rex.RB (bad) 
  400785:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  40078b:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff867015d9 <__TMC_END__+0xffffffff861005a9>
  400791:	06                   	(bad)  
  400792:	48 0e                	rex.W (bad) 
  400794:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  40079a:	72 0e                	jb     4007aa <__GNU_EH_FRAME_HDR+0x10a>
  40079c:	38 41 0e             	cmp    %al,0xe(%rcx)
  40079f:	30 41 0e             	xor    %al,0xe(%rcx)
  4007a2:	28 42 0e             	sub    %al,0xe(%rdx)
  4007a5:	20 42 0e             	and    %al,0xe(%rdx)
  4007a8:	18 42 0e             	sbb    %al,0xe(%rdx)
  4007ab:	10 42 0e             	adc    %al,0xe(%rdx)
  4007ae:	08 00                	or     %al,(%rax)
  4007b0:	14 00                	adc    $0x0,%al
  4007b2:	00 00                	add    %al,(%rax)
  4007b4:	ac                   	lods   %ds:(%rsi),%al
  4007b5:	00 00                	add    %al,(%rax)
  4007b7:	00 c8                	add    %cl,%al
  4007b9:	fe                   	(bad)  
  4007ba:	ff                   	(bad)  
  4007bb:	ff 02                	incl   (%rdx)
	...

00000000004007c8 <__FRAME_END__>:
  4007c8:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600de0 <__frame_dummy_init_array_entry>:
  600de0:	c0 05 40 00 00 00 00 	rolb   $0x0,0x40(%rip)        # 600e27 <_DYNAMIC+0x2f>
	...

Disassembly of section .fini_array:

0000000000600de8 <__do_global_dtors_aux_fini_array_entry>:
  600de8:	a0                   	.byte 0xa0
  600de9:	05 40 00 00 00       	add    $0x40,%eax
	...

Disassembly of section .jcr:

0000000000600df0 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000600df8 <_DYNAMIC>:
  600df8:	01 00                	add    %eax,(%rax)
  600dfa:	00 00                	add    %al,(%rax)
  600dfc:	00 00                	add    %al,(%rax)
  600dfe:	00 00                	add    %al,(%rax)
  600e00:	01 00                	add    %eax,(%rax)
  600e02:	00 00                	add    %al,(%rax)
  600e04:	00 00                	add    %al,(%rax)
  600e06:	00 00                	add    %al,(%rax)
  600e08:	01 00                	add    %eax,(%rax)
  600e0a:	00 00                	add    %al,(%rax)
  600e0c:	00 00                	add    %al,(%rax)
  600e0e:	00 00                	add    %al,(%rax)
  600e10:	69 00 00 00 00 00    	imul   $0x0,(%rax),%eax
  600e16:	00 00                	add    %al,(%rax)
  600e18:	01 00                	add    %eax,(%rax)
  600e1a:	00 00                	add    %al,(%rax)
  600e1c:	00 00                	add    %al,(%rax)
  600e1e:	00 00                	add    %al,(%rax)
  600e20:	73 00                	jae    600e22 <_DYNAMIC+0x2a>
  600e22:	00 00                	add    %al,(%rax)
  600e24:	00 00                	add    %al,(%rax)
  600e26:	00 00                	add    %al,(%rax)
  600e28:	01 00                	add    %eax,(%rax)
  600e2a:	00 00                	add    %al,(%rax)
  600e2c:	00 00                	add    %al,(%rax)
  600e2e:	00 00                	add    %al,(%rax)
  600e30:	81 00 00 00 00 00    	addl   $0x0,(%rax)
  600e36:	00 00                	add    %al,(%rax)
  600e38:	0c 00                	or     $0x0,%al
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	88 04 40             	mov    %al,(%rax,%rax,2)
  600e43:	00 00                	add    %al,(%rax)
  600e45:	00 00                	add    %al,(%rax)
  600e47:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 600e4d <_DYNAMIC+0x55>
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 84 06 40 00 00 00 	add    %al,0x40(%rsi,%rax,1)
  600e56:	00 00                	add    %al,(%rax)
  600e58:	19 00                	sbb    %eax,(%rax)
  600e5a:	00 00                	add    %al,(%rax)
  600e5c:	00 00                	add    %al,(%rax)
  600e5e:	00 00                	add    %al,(%rax)
  600e60:	e0 0d                	loopne 600e6f <_DYNAMIC+0x77>
  600e62:	60                   	(bad)  
  600e63:	00 00                	add    %al,(%rax)
  600e65:	00 00                	add    %al,(%rax)
  600e67:	00 1b                	add    %bl,(%rbx)
  600e69:	00 00                	add    %al,(%rax)
  600e6b:	00 00                	add    %al,(%rax)
  600e6d:	00 00                	add    %al,(%rax)
  600e6f:	00 08                	add    %cl,(%rax)
  600e71:	00 00                	add    %al,(%rax)
  600e73:	00 00                	add    %al,(%rax)
  600e75:	00 00                	add    %al,(%rax)
  600e77:	00 1a                	add    %bl,(%rdx)
  600e79:	00 00                	add    %al,(%rax)
  600e7b:	00 00                	add    %al,(%rax)
  600e7d:	00 00                	add    %al,(%rax)
  600e7f:	00 e8                	add    %ch,%al
  600e81:	0d 60 00 00 00       	or     $0x60,%eax
  600e86:	00 00                	add    %al,(%rax)
  600e88:	1c 00                	sbb    $0x0,%al
  600e8a:	00 00                	add    %al,(%rax)
  600e8c:	00 00                	add    %al,(%rax)
  600e8e:	00 00                	add    %al,(%rax)
  600e90:	08 00                	or     %al,(%rax)
  600e92:	00 00                	add    %al,(%rax)
  600e94:	00 00                	add    %al,(%rax)
  600e96:	00 00                	add    %al,(%rax)
  600e98:	f5                   	cmc    
  600e99:	fe                   	(bad)  
  600e9a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600e9d:	00 00                	add    %al,(%rax)
  600e9f:	00 98 02 40 00 00    	add    %bl,0x4002(%rax)
  600ea5:	00 00                	add    %al,(%rax)
  600ea7:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 600ead <_DYNAMIC+0xb5>
  600ead:	00 00                	add    %al,(%rax)
  600eaf:	00 60 03             	add    %ah,0x3(%rax)
  600eb2:	40 00 00             	add    %al,(%rax)
  600eb5:	00 00                	add    %al,(%rax)
  600eb7:	00 06                	add    %al,(%rsi)
  600eb9:	00 00                	add    %al,(%rax)
  600ebb:	00 00                	add    %al,(%rax)
  600ebd:	00 00                	add    %al,(%rax)
  600ebf:	00 b8 02 40 00 00    	add    %bh,0x4002(%rax)
  600ec5:	00 00                	add    %al,(%rax)
  600ec7:	00 0a                	add    %cl,(%rdx)
  600ec9:	00 00                	add    %al,(%rax)
  600ecb:	00 00                	add    %al,(%rax)
  600ecd:	00 00                	add    %al,(%rax)
  600ecf:	00 b0 00 00 00 00    	add    %dh,0x0(%rax)
  600ed5:	00 00                	add    %al,(%rax)
  600ed7:	00 0b                	add    %cl,(%rbx)
  600ed9:	00 00                	add    %al,(%rax)
  600edb:	00 00                	add    %al,(%rax)
  600edd:	00 00                	add    %al,(%rax)
  600edf:	00 18                	add    %bl,(%rax)
  600ee1:	00 00                	add    %al,(%rax)
  600ee3:	00 00                	add    %al,(%rax)
  600ee5:	00 00                	add    %al,(%rax)
  600ee7:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 600eed <_DYNAMIC+0xf5>
	...
  600ef5:	00 00                	add    %al,(%rax)
  600ef7:	00 03                	add    %al,(%rbx)
	...
  600f01:	10 60 00             	adc    %ah,0x0(%rax)
  600f04:	00 00                	add    %al,(%rax)
  600f06:	00 00                	add    %al,(%rax)
  600f08:	02 00                	add    (%rax),%al
  600f0a:	00 00                	add    %al,(%rax)
  600f0c:	00 00                	add    %al,(%rax)
  600f0e:	00 00                	add    %al,(%rax)
  600f10:	30 00                	xor    %al,(%rax)
  600f12:	00 00                	add    %al,(%rax)
  600f14:	00 00                	add    %al,(%rax)
  600f16:	00 00                	add    %al,(%rax)
  600f18:	14 00                	adc    $0x0,%al
  600f1a:	00 00                	add    %al,(%rax)
  600f1c:	00 00                	add    %al,(%rax)
  600f1e:	00 00                	add    %al,(%rax)
  600f20:	07                   	(bad)  
  600f21:	00 00                	add    %al,(%rax)
  600f23:	00 00                	add    %al,(%rax)
  600f25:	00 00                	add    %al,(%rax)
  600f27:	00 17                	add    %dl,(%rdi)
  600f29:	00 00                	add    %al,(%rax)
  600f2b:	00 00                	add    %al,(%rax)
  600f2d:	00 00                	add    %al,(%rax)
  600f2f:	00 58 04             	add    %bl,0x4(%rax)
  600f32:	40 00 00             	add    %al,(%rax)
  600f35:	00 00                	add    %al,(%rax)
  600f37:	00 07                	add    %al,(%rdi)
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 40 04             	add    %al,0x4(%rax)
  600f42:	40 00 00             	add    %al,(%rax)
  600f45:	00 00                	add    %al,(%rax)
  600f47:	00 08                	add    %cl,(%rax)
  600f49:	00 00                	add    %al,(%rax)
  600f4b:	00 00                	add    %al,(%rax)
  600f4d:	00 00                	add    %al,(%rax)
  600f4f:	00 18                	add    %bl,(%rax)
  600f51:	00 00                	add    %al,(%rax)
  600f53:	00 00                	add    %al,(%rax)
  600f55:	00 00                	add    %al,(%rax)
  600f57:	00 09                	add    %cl,(%rcx)
  600f59:	00 00                	add    %al,(%rax)
  600f5b:	00 00                	add    %al,(%rax)
  600f5d:	00 00                	add    %al,(%rax)
  600f5f:	00 18                	add    %bl,(%rax)
  600f61:	00 00                	add    %al,(%rax)
  600f63:	00 00                	add    %al,(%rax)
  600f65:	00 00                	add    %al,(%rax)
  600f67:	00 fe                	add    %bh,%dh
  600f69:	ff                   	(bad)  
  600f6a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f6d:	00 00                	add    %al,(%rax)
  600f6f:	00 20                	add    %ah,(%rax)
  600f71:	04 40                	add    $0x40,%al
  600f73:	00 00                	add    %al,(%rax)
  600f75:	00 00                	add    %al,(%rax)
  600f77:	00 ff                	add    %bh,%bh
  600f79:	ff                   	(bad)  
  600f7a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f7d:	00 00                	add    %al,(%rax)
  600f7f:	00 01                	add    %al,(%rcx)
  600f81:	00 00                	add    %al,(%rax)
  600f83:	00 00                	add    %al,(%rax)
  600f85:	00 00                	add    %al,(%rax)
  600f87:	00 f0                	add    %dh,%al
  600f89:	ff                   	(bad)  
  600f8a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f8d:	00 00                	add    %al,(%rax)
  600f8f:	00 10                	add    %dl,(%rax)
  600f91:	04 40                	add    $0x40,%al
	...

Disassembly of section .got:

0000000000600ff8 <.got>:
	...

Disassembly of section .got.plt:

0000000000601000 <_GLOBAL_OFFSET_TABLE_>:
  601000:	f8                   	clc    
  601001:	0d 60 00 00 00       	or     $0x60,%eax
	...
  601016:	00 00                	add    %al,(%rax)
  601018:	c6 04 40 00          	movb   $0x0,(%rax,%rax,2)
  60101c:	00 00                	add    %al,(%rax)
  60101e:	00 00                	add    %al,(%rax)
  601020:	d6                   	(bad)  
  601021:	04 40                	add    $0x40,%al
  601023:	00 00                	add    %al,(%rax)
  601025:	00 00                	add    %al,(%rax)
	...

Disassembly of section .data:

0000000000601028 <__data_start>:
  601028:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

000000000060102c <__bss_start>:
  60102c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 47 4e             	sub    %al,0x4e(%rdi)
   8:	55                   	push   %rbp
   9:	29 20                	sub    %esp,(%rax)
   b:	36 2e 32 2e          	ss xor %cs:(%rsi),%ch
   f:	31 20                	xor    %esp,(%rax)
  11:	32 30                	xor    (%rax),%dh
  13:	31 36                	xor    %esi,(%rsi)
  15:	30 39                	xor    %bh,(%rcx)
  17:	31 36                	xor    %esi,(%rsi)
  19:	20 28                	and    %ch,(%rax)
  1b:	52                   	push   %rdx
  1c:	65 64 20 48 61       	gs and %cl,%fs:0x61(%rax)
  21:	74 20                	je     43 <_init-0x400445>
  23:	36 2e 32 2e          	ss xor %cs:(%rsi),%ch
  27:	31 2d 32 29 00 47    	xor    %ebp,0x47002932(%rip)        # 4700295f <__TMC_END__+0x46a0192f>
  2d:	43                   	rex.XB
  2e:	43 3a 20             	rex.XB cmp (%r8),%spl
  31:	28 47 4e             	sub    %al,0x4e(%rdi)
  34:	55                   	push   %rbp
  35:	29 20                	sub    %esp,(%rax)
  37:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
  3b:	31 20                	xor    %esp,(%rax)
  3d:	32 30                	xor    (%rax),%dh
  3f:	31 36                	xor    %esi,(%rsi)
  41:	31 32                	xor    %esi,(%rdx)
  43:	32 31                	xor    (%rcx),%dh
  45:	20 28                	and    %ch,(%rax)
  47:	52                   	push   %rdx
  48:	65 64 20 48 61       	gs and %cl,%fs:0x61(%rax)
  4d:	74 20                	je     6f <_init-0x400419>
  4f:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
  53:	31                   	.byte 0x31
  54:	2d                   	.byte 0x2d
  55:	31 29                	xor    %ebp,(%rcx)
	...
