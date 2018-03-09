
new:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x243>
  400248:	78 38                	js     400282 <_init-0x236>
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
  400283:	00 6e bf             	add    %ch,-0x41(%rsi)
  400286:	b4 f5                	mov    $0xf5,%ah
  400288:	e7 16                	out    %eax,$0x16
  40028a:	73 c2                	jae    40024e <_init-0x26a>
  40028c:	b4 1d                	mov    $0x1d,%ah
  40028e:	d6                   	(bad)  
  40028f:	a2 fc d3 8b 66 59 0c 	movabs %al,0x89730c59668bd3fc
  400296:	73 89 

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
  4002ff:	00 91 00 00 00 12    	add    %dl,0x12000000(%rcx)
	...
  400315:	00 00                	add    %al,(%rax)
  400317:	00 33                	add    %dh,(%rbx)
  400319:	00 00                	add    %al,(%rax)
  40031b:	00 20                	add    %ah,(%rax)
	...
  40032d:	00 00                	add    %al,(%rax)
  40032f:	00 4f 00             	add    %cl,0x0(%rdi)
  400332:	00 00                	add    %al,(%rax)
  400334:	20 00                	and    %al,(%rax)
	...
  400346:	00 00                	add    %al,(%rax)
  400348:	69 00 00 00 12 00    	imul   $0x120000,(%rax),%eax
	...

Disassembly of section .dynstr:

0000000000400360 <.dynstr>:
  400360:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  400364:	73 74                	jae    4003da <_init-0xde>
  400366:	64 63 2b             	movslq %fs:(%rbx),%ebp
  400369:	2b 2e                	sub    (%rsi),%ebp
  40036b:	73 6f                	jae    4003dc <_init-0xdc>
  40036d:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%rdi)
  400372:	67 6d                	insl   (%dx),%es:(%edi)
  400374:	6f                   	outsl  %ds:(%rsi),(%dx)
  400375:	6e                   	outsb  %ds:(%rsi),(%dx)
  400376:	5f                   	pop    %rdi
  400377:	73 74                	jae    4003ed <_init-0xcb>
  400379:	61                   	(bad)  
  40037a:	72 74                	jb     4003f0 <_init-0xc8>
  40037c:	5f                   	pop    %rdi
  40037d:	5f                   	pop    %rdi
  40037e:	00 5f 4a             	add    %bl,0x4a(%rdi)
  400381:	76 5f                	jbe    4003e2 <_init-0xd6>
  400383:	52                   	push   %rdx
  400384:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%ebx),%esi
  40038b:	43 6c 
  40038d:	61                   	(bad)  
  40038e:	73 73                	jae    400403 <_init-0xb5>
  400390:	65 73 00             	gs jae 400393 <_init-0x125>
  400393:	5f                   	pop    %rdi
  400394:	49 54                	rex.WB push %r12
  400396:	4d 5f                	rex.WRB pop %r15
  400398:	64 65 72 65          	fs gs jb 400401 <_init-0xb7>
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
  4003b4:	72 65                	jb     40041b <_init-0x9d>
  4003b6:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  4003bd:	4d 
  4003be:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  4003c0:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003c1:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003c2:	65 54                	gs push %rsp
  4003c4:	61                   	(bad)  
  4003c5:	62                   	(bad)  
  4003c6:	6c                   	insb   (%dx),%es:(%rdi)
  4003c7:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
  4003cb:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003cc:	77 6d                	ja     40043b <_init-0x7d>
  4003ce:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  4003d2:	6d                   	insl   (%dx),%es:(%rdi)
  4003d3:	2e 73 6f             	jae,pn 400445 <_init-0x73>
  4003d6:	2e 36 00 6c 69 62    	cs add %ch,%ss:0x62(%rcx,%rbp,2)
  4003dc:	67 63 63 5f          	movslq 0x5f(%ebx),%esp
  4003e0:	73 2e                	jae    400410 <_init-0xa8>
  4003e2:	73 6f                	jae    400453 <_init-0x65>
  4003e4:	2e 31 00             	xor    %eax,%cs:(%rax)
  4003e7:	6c                   	insb   (%dx),%es:(%rdi)
  4003e8:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%rdx),%esp
  4003ef:	36 00 5f 5f          	add    %bl,%ss:0x5f(%rdi)
  4003f3:	6c                   	insb   (%dx),%es:(%rdi)
  4003f4:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  4003fb:	72 74                	jb     400471 <_init-0x47>
  4003fd:	5f                   	pop    %rdi
  4003fe:	6d                   	insl   (%dx),%es:(%rdi)
  4003ff:	61                   	(bad)  
  400400:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
  400407:	43 58                	rex.XB pop %r8
  400409:	58                   	pop    %rax
  40040a:	5f                   	pop    %rdi
  40040b:	33 2e                	xor    (%rsi),%ebp
  40040d:	34 00                	xor    $0x0,%al
  40040f:	47                   	rex.RXB
  400410:	4c                   	rex.WR
  400411:	49                   	rex.WB
  400412:	42                   	rex.X
  400413:	43 5f                	rex.XB pop %r15
  400415:	32 2e                	xor    (%rsi),%ch
  400417:	32 2e                	xor    (%rsi),%ch
  400419:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

000000000040041c <.gnu.version>:
  40041c:	00 00                	add    %al,(%rax)
  40041e:	00 00                	add    %al,(%rax)
  400420:	00 00                	add    %al,(%rax)
  400422:	02 00                	add    (%rax),%al
  400424:	00 00                	add    %al,(%rax)
  400426:	00 00                	add    %al,(%rax)
  400428:	03 00                	add    (%rax),%eax

Disassembly of section .gnu.version_r:

0000000000400430 <.gnu.version_r>:
  400430:	01 00                	add    %eax,(%rax)
  400432:	01 00                	add    %eax,(%rax)
  400434:	01 00                	add    %eax,(%rax)
  400436:	00 00                	add    %al,(%rax)
  400438:	10 00                	adc    %al,(%rax)
  40043a:	00 00                	add    %al,(%rax)
  40043c:	20 00                	and    %al,(%rax)
  40043e:	00 00                	add    %al,(%rax)
  400440:	74 29                	je     40046b <_init-0x4d>
  400442:	92                   	xchg   %eax,%edx
  400443:	08 00                	or     %al,(%rax)
  400445:	00 03                	add    %al,(%rbx)
  400447:	00 a3 00 00 00 00    	add    %ah,0x0(%rbx)
  40044d:	00 00                	add    %al,(%rax)
  40044f:	00 01                	add    %al,(%rcx)
  400451:	00 01                	add    %al,(%rcx)
  400453:	00 87 00 00 00 10    	add    %al,0x10000000(%rdi)
  400459:	00 00                	add    %al,(%rax)
  40045b:	00 00                	add    %al,(%rax)
  40045d:	00 00                	add    %al,(%rax)
  40045f:	00 75 1a             	add    %dh,0x1a(%rbp)
  400462:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  400468:	af                   	scas   %es:(%rdi),%eax
  400469:	00 00                	add    %al,(%rax)
  40046b:	00 00                	add    %al,(%rax)
  40046d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000400470 <.rela.dyn>:
  400470:	f8                   	clc    
  400471:	0f 60 00             	punpcklbw (%rax),%mm0
  400474:	00 00                	add    %al,(%rax)
  400476:	00 00                	add    %al,(%rax)
  400478:	06                   	(bad)  
  400479:	00 00                	add    %al,(%rax)
  40047b:	00 01                	add    %al,(%rcx)
	...

Disassembly of section .rela.plt:

0000000000400488 <.rela.plt>:
  400488:	18 10                	sbb    %dl,(%rax)
  40048a:	60                   	(bad)  
  40048b:	00 00                	add    %al,(%rax)
  40048d:	00 00                	add    %al,(%rax)
  40048f:	00 07                	add    %al,(%rdi)
  400491:	00 00                	add    %al,(%rax)
  400493:	00 03                	add    %al,(%rbx)
	...
  40049d:	00 00                	add    %al,(%rax)
  40049f:	00 20                	add    %ah,(%rax)
  4004a1:	10 60 00             	adc    %ah,0x0(%rax)
  4004a4:	00 00                	add    %al,(%rax)
  4004a6:	00 00                	add    %al,(%rax)
  4004a8:	07                   	(bad)  
  4004a9:	00 00                	add    %al,(%rax)
  4004ab:	00 06                	add    %al,(%rsi)
	...

Disassembly of section .init:

00000000004004b8 <_init>:
  4004b8:	48 83 ec 08          	sub    $0x8,%rsp
  4004bc:	48 8b 05 35 0b 20 00 	mov    0x200b35(%rip),%rax        # 600ff8 <_DYNAMIC+0x200>
  4004c3:	48 85 c0             	test   %rax,%rax
  4004c6:	74 05                	je     4004cd <_init+0x15>
  4004c8:	e8 43 00 00 00       	callq  400510 <_Znwm@plt+0x10>
  4004cd:	48 83 c4 08          	add    $0x8,%rsp
  4004d1:	c3                   	retq   

Disassembly of section .plt:

00000000004004e0 <__libc_start_main@plt-0x10>:
  4004e0:	ff 35 22 0b 20 00    	pushq  0x200b22(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004e6:	ff 25 24 0b 20 00    	jmpq   *0x200b24(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004f0 <__libc_start_main@plt>:
  4004f0:	ff 25 22 0b 20 00    	jmpq   *0x200b22(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4004f6:	68 00 00 00 00       	pushq  $0x0
  4004fb:	e9 e0 ff ff ff       	jmpq   4004e0 <_init+0x28>

0000000000400500 <_Znwm@plt>:
  400500:	ff 25 1a 0b 20 00    	jmpq   *0x200b1a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400506:	68 01 00 00 00       	pushq  $0x1
  40050b:	e9 d0 ff ff ff       	jmpq   4004e0 <_init+0x28>

Disassembly of section .plt.got:

0000000000400510 <.plt.got>:
  400510:	ff 25 e2 0a 20 00    	jmpq   *0x200ae2(%rip)        # 600ff8 <_DYNAMIC+0x200>
  400516:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400520 <_start>:
  400520:	31 ed                	xor    %ebp,%ebp
  400522:	49 89 d1             	mov    %rdx,%r9
  400525:	5e                   	pop    %rsi
  400526:	48 89 e2             	mov    %rsp,%rdx
  400529:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40052d:	50                   	push   %rax
  40052e:	54                   	push   %rsp
  40052f:	49 c7 c0 b0 06 40 00 	mov    $0x4006b0,%r8
  400536:	48 c7 c1 40 06 40 00 	mov    $0x400640,%rcx
  40053d:	48 c7 c7 16 06 40 00 	mov    $0x400616,%rdi
  400544:	e8 a7 ff ff ff       	callq  4004f0 <__libc_start_main@plt>
  400549:	f4                   	hlt    
  40054a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400550 <deregister_tm_clones>:
  400550:	b8 37 10 60 00       	mov    $0x601037,%eax
  400555:	55                   	push   %rbp
  400556:	48 2d 30 10 60 00    	sub    $0x601030,%rax
  40055c:	48 83 f8 0e          	cmp    $0xe,%rax
  400560:	48 89 e5             	mov    %rsp,%rbp
  400563:	76 1b                	jbe    400580 <deregister_tm_clones+0x30>
  400565:	b8 00 00 00 00       	mov    $0x0,%eax
  40056a:	48 85 c0             	test   %rax,%rax
  40056d:	74 11                	je     400580 <deregister_tm_clones+0x30>
  40056f:	5d                   	pop    %rbp
  400570:	bf 30 10 60 00       	mov    $0x601030,%edi
  400575:	ff e0                	jmpq   *%rax
  400577:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40057e:	00 00 
  400580:	5d                   	pop    %rbp
  400581:	c3                   	retq   
  400582:	0f 1f 40 00          	nopl   0x0(%rax)
  400586:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40058d:	00 00 00 

0000000000400590 <register_tm_clones>:
  400590:	be 30 10 60 00       	mov    $0x601030,%esi
  400595:	55                   	push   %rbp
  400596:	48 81 ee 30 10 60 00 	sub    $0x601030,%rsi
  40059d:	48 c1 fe 03          	sar    $0x3,%rsi
  4005a1:	48 89 e5             	mov    %rsp,%rbp
  4005a4:	48 89 f0             	mov    %rsi,%rax
  4005a7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4005ab:	48 01 c6             	add    %rax,%rsi
  4005ae:	48 d1 fe             	sar    %rsi
  4005b1:	74 15                	je     4005c8 <register_tm_clones+0x38>
  4005b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4005b8:	48 85 c0             	test   %rax,%rax
  4005bb:	74 0b                	je     4005c8 <register_tm_clones+0x38>
  4005bd:	5d                   	pop    %rbp
  4005be:	bf 30 10 60 00       	mov    $0x601030,%edi
  4005c3:	ff e0                	jmpq   *%rax
  4005c5:	0f 1f 00             	nopl   (%rax)
  4005c8:	5d                   	pop    %rbp
  4005c9:	c3                   	retq   
  4005ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005d0 <__do_global_dtors_aux>:
  4005d0:	80 3d 55 0a 20 00 00 	cmpb   $0x0,0x200a55(%rip)        # 60102c <_edata>
  4005d7:	75 11                	jne    4005ea <__do_global_dtors_aux+0x1a>
  4005d9:	55                   	push   %rbp
  4005da:	48 89 e5             	mov    %rsp,%rbp
  4005dd:	e8 6e ff ff ff       	callq  400550 <deregister_tm_clones>
  4005e2:	5d                   	pop    %rbp
  4005e3:	c6 05 42 0a 20 00 01 	movb   $0x1,0x200a42(%rip)        # 60102c <_edata>
  4005ea:	f3 c3                	repz retq 
  4005ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005f0 <frame_dummy>:
  4005f0:	bf f0 0d 60 00       	mov    $0x600df0,%edi
  4005f5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4005f9:	75 05                	jne    400600 <frame_dummy+0x10>
  4005fb:	eb 93                	jmp    400590 <register_tm_clones>
  4005fd:	0f 1f 00             	nopl   (%rax)
  400600:	b8 00 00 00 00       	mov    $0x0,%eax
  400605:	48 85 c0             	test   %rax,%rax
  400608:	74 f1                	je     4005fb <frame_dummy+0xb>
  40060a:	55                   	push   %rbp
  40060b:	48 89 e5             	mov    %rsp,%rbp
  40060e:	ff d0                	callq  *%rax
  400610:	5d                   	pop    %rbp
  400611:	e9 7a ff ff ff       	jmpq   400590 <register_tm_clones>

0000000000400616 <main>:
  400616:	55                   	push   %rbp
  400617:	48 89 e5             	mov    %rsp,%rbp
  40061a:	48 83 ec 10          	sub    $0x10,%rsp
  40061e:	bf 04 00 00 00       	mov    $0x4,%edi
  400623:	e8 d8 fe ff ff       	callq  400500 <_Znwm@plt>
  400628:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40062c:	b8 00 00 00 00       	mov    $0x0,%eax
  400631:	c9                   	leaveq 
  400632:	c3                   	retq   
  400633:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40063a:	00 00 00 
  40063d:	0f 1f 00             	nopl   (%rax)

0000000000400640 <__libc_csu_init>:
  400640:	41 57                	push   %r15
  400642:	41 56                	push   %r14
  400644:	41 89 ff             	mov    %edi,%r15d
  400647:	41 55                	push   %r13
  400649:	41 54                	push   %r12
  40064b:	4c 8d 25 8e 07 20 00 	lea    0x20078e(%rip),%r12        # 600de0 <__frame_dummy_init_array_entry>
  400652:	55                   	push   %rbp
  400653:	48 8d 2d 8e 07 20 00 	lea    0x20078e(%rip),%rbp        # 600de8 <__init_array_end>
  40065a:	53                   	push   %rbx
  40065b:	49 89 f6             	mov    %rsi,%r14
  40065e:	49 89 d5             	mov    %rdx,%r13
  400661:	4c 29 e5             	sub    %r12,%rbp
  400664:	48 83 ec 08          	sub    $0x8,%rsp
  400668:	48 c1 fd 03          	sar    $0x3,%rbp
  40066c:	e8 47 fe ff ff       	callq  4004b8 <_init>
  400671:	48 85 ed             	test   %rbp,%rbp
  400674:	74 20                	je     400696 <__libc_csu_init+0x56>
  400676:	31 db                	xor    %ebx,%ebx
  400678:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40067f:	00 
  400680:	4c 89 ea             	mov    %r13,%rdx
  400683:	4c 89 f6             	mov    %r14,%rsi
  400686:	44 89 ff             	mov    %r15d,%edi
  400689:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40068d:	48 83 c3 01          	add    $0x1,%rbx
  400691:	48 39 dd             	cmp    %rbx,%rbp
  400694:	75 ea                	jne    400680 <__libc_csu_init+0x40>
  400696:	48 83 c4 08          	add    $0x8,%rsp
  40069a:	5b                   	pop    %rbx
  40069b:	5d                   	pop    %rbp
  40069c:	41 5c                	pop    %r12
  40069e:	41 5d                	pop    %r13
  4006a0:	41 5e                	pop    %r14
  4006a2:	41 5f                	pop    %r15
  4006a4:	c3                   	retq   
  4006a5:	90                   	nop
  4006a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006ad:	00 00 00 

00000000004006b0 <__libc_csu_fini>:
  4006b0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004006b4 <_fini>:
  4006b4:	48 83 ec 08          	sub    $0x8,%rsp
  4006b8:	48 83 c4 08          	add    $0x8,%rsp
  4006bc:	c3                   	retq   

Disassembly of section .rodata:

00000000004006c0 <_IO_stdin_used>:
  4006c0:	01 00                	add    %eax,(%rax)
  4006c2:	02 00                	add    (%rax),%al
  4006c4:	00 00                	add    %al,(%rax)
	...

00000000004006c8 <__dso_handle>:
	...

Disassembly of section .eh_frame_hdr:

00000000004006d0 <__GNU_EH_FRAME_HDR>:
  4006d0:	01 1b                	add    %ebx,(%rbx)
  4006d2:	03 3b                	add    (%rbx),%edi
  4006d4:	34 00                	xor    $0x0,%al
  4006d6:	00 00                	add    %al,(%rax)
  4006d8:	05 00 00 00 10       	add    $0x10000000,%eax
  4006dd:	fe                   	(bad)  
  4006de:	ff                   	(bad)  
  4006df:	ff 80 00 00 00 50    	incl   0x50000000(%rax)
  4006e5:	fe                   	(bad)  
  4006e6:	ff                   	(bad)  
  4006e7:	ff 50 00             	callq  *0x0(%rax)
  4006ea:	00 00                	add    %al,(%rax)
  4006ec:	46 ff                	rex.RX (bad) 
  4006ee:	ff                   	(bad)  
  4006ef:	ff a8 00 00 00 70    	ljmp   *0x70000000(%rax)
  4006f5:	ff                   	(bad)  
  4006f6:	ff                   	(bad)  
  4006f7:	ff c8                	dec    %eax
  4006f9:	00 00                	add    %al,(%rax)
  4006fb:	00 e0                	add    %ah,%al
  4006fd:	ff                   	(bad)  
  4006fe:	ff                   	(bad)  
  4006ff:	ff 10                	callq  *(%rax)
  400701:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .eh_frame:

0000000000400708 <__FRAME_END__-0xf0>:
  400708:	14 00                	adc    $0x0,%al
  40070a:	00 00                	add    %al,(%rax)
  40070c:	00 00                	add    %al,(%rax)
  40070e:	00 00                	add    %al,(%rax)
  400710:	01 7a 52             	add    %edi,0x52(%rdx)
  400713:	00 01                	add    %al,(%rcx)
  400715:	78 10                	js     400727 <__GNU_EH_FRAME_HDR+0x57>
  400717:	01 1b                	add    %ebx,(%rbx)
  400719:	0c 07                	or     $0x7,%al
  40071b:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  400721:	00 00                	add    %al,(%rax)
  400723:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400726:	00 00                	add    %al,(%rax)
  400728:	f8                   	clc    
  400729:	fd                   	std    
  40072a:	ff                   	(bad)  
  40072b:	ff 2a                	ljmp   *(%rdx)
	...
  400735:	00 00                	add    %al,(%rax)
  400737:	00 14 00             	add    %dl,(%rax,%rax,1)
  40073a:	00 00                	add    %al,(%rax)
  40073c:	00 00                	add    %al,(%rax)
  40073e:	00 00                	add    %al,(%rax)
  400740:	01 7a 52             	add    %edi,0x52(%rdx)
  400743:	00 01                	add    %al,(%rcx)
  400745:	78 10                	js     400757 <__GNU_EH_FRAME_HDR+0x87>
  400747:	01 1b                	add    %ebx,(%rbx)
  400749:	0c 07                	or     $0x7,%al
  40074b:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  400751:	00 00                	add    %al,(%rax)
  400753:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400756:	00 00                	add    %al,(%rax)
  400758:	88 fd                	mov    %bh,%ch
  40075a:	ff                   	(bad)  
  40075b:	ff 30                	pushq  (%rax)
  40075d:	00 00                	add    %al,(%rax)
  40075f:	00 00                	add    %al,(%rax)
  400761:	0e                   	(bad)  
  400762:	10 46 0e             	adc    %al,0xe(%rsi)
  400765:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400768:	0b 77 08             	or     0x8(%rdi),%esi
  40076b:	80 00 3f             	addb   $0x3f,(%rax)
  40076e:	1a 3b                	sbb    (%rbx),%bh
  400770:	2a 33                	sub    (%rbx),%dh
  400772:	24 22                	and    $0x22,%al
  400774:	00 00                	add    %al,(%rax)
  400776:	00 00                	add    %al,(%rax)
  400778:	1c 00                	sbb    $0x0,%al
  40077a:	00 00                	add    %al,(%rax)
  40077c:	44 00 00             	add    %r8b,(%rax)
  40077f:	00 96 fe ff ff 1d    	add    %dl,0x1dfffffe(%rsi)
  400785:	00 00                	add    %al,(%rax)
  400787:	00 00                	add    %al,(%rax)
  400789:	41 0e                	rex.B (bad) 
  40078b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400791:	58                   	pop    %rax
  400792:	0c 07                	or     $0x7,%al
  400794:	08 00                	or     %al,(%rax)
  400796:	00 00                	add    %al,(%rax)
  400798:	44 00 00             	add    %r8b,(%rax)
  40079b:	00 64 00 00          	add    %ah,0x0(%rax,%rax,1)
  40079f:	00 a0 fe ff ff 65    	add    %ah,0x65fffffe(%rax)
  4007a5:	00 00                	add    %al,(%rax)
  4007a7:	00 00                	add    %al,(%rax)
  4007a9:	42 0e                	rex.X (bad) 
  4007ab:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  4007b1:	8e 03                	mov    (%rbx),%es
  4007b3:	45 0e                	rex.RB (bad) 
  4007b5:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  4007bb:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86701609 <__TMC_END__+0xffffffff861005d9>
  4007c1:	06                   	(bad)  
  4007c2:	48 0e                	rex.W (bad) 
  4007c4:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  4007ca:	72 0e                	jb     4007da <__GNU_EH_FRAME_HDR+0x10a>
  4007cc:	38 41 0e             	cmp    %al,0xe(%rcx)
  4007cf:	30 41 0e             	xor    %al,0xe(%rcx)
  4007d2:	28 42 0e             	sub    %al,0xe(%rdx)
  4007d5:	20 42 0e             	and    %al,0xe(%rdx)
  4007d8:	18 42 0e             	sbb    %al,0xe(%rdx)
  4007db:	10 42 0e             	adc    %al,0xe(%rdx)
  4007de:	08 00                	or     %al,(%rax)
  4007e0:	14 00                	adc    $0x0,%al
  4007e2:	00 00                	add    %al,(%rax)
  4007e4:	ac                   	lods   %ds:(%rsi),%al
  4007e5:	00 00                	add    %al,(%rax)
  4007e7:	00 c8                	add    %cl,%al
  4007e9:	fe                   	(bad)  
  4007ea:	ff                   	(bad)  
  4007eb:	ff 02                	incl   (%rdx)
	...

00000000004007f8 <__FRAME_END__>:
  4007f8:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600de0 <__frame_dummy_init_array_entry>:
  600de0:	f0 05 40 00 00 00    	lock add $0x40,%eax
	...

Disassembly of section .fini_array:

0000000000600de8 <__do_global_dtors_aux_fini_array_entry>:
  600de8:	d0 05 40 00 00 00    	rolb   0x40(%rip)        # 600e2e <_DYNAMIC+0x36>
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
  600e10:	6f                   	outsl  %ds:(%rsi),(%dx)
  600e11:	00 00                	add    %al,(%rax)
  600e13:	00 00                	add    %al,(%rax)
  600e15:	00 00                	add    %al,(%rax)
  600e17:	00 01                	add    %al,(%rcx)
  600e19:	00 00                	add    %al,(%rax)
  600e1b:	00 00                	add    %al,(%rax)
  600e1d:	00 00                	add    %al,(%rax)
  600e1f:	00 79 00             	add    %bh,0x0(%rcx)
  600e22:	00 00                	add    %al,(%rax)
  600e24:	00 00                	add    %al,(%rax)
  600e26:	00 00                	add    %al,(%rax)
  600e28:	01 00                	add    %eax,(%rax)
  600e2a:	00 00                	add    %al,(%rax)
  600e2c:	00 00                	add    %al,(%rax)
  600e2e:	00 00                	add    %al,(%rax)
  600e30:	87 00                	xchg   %eax,(%rax)
  600e32:	00 00                	add    %al,(%rax)
  600e34:	00 00                	add    %al,(%rax)
  600e36:	00 00                	add    %al,(%rax)
  600e38:	0c 00                	or     $0x0,%al
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	b8 04 40 00 00       	mov    $0x4004,%eax
  600e45:	00 00                	add    %al,(%rax)
  600e47:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 600e4d <_DYNAMIC+0x55>
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 b4 06 40 00 00 00 	add    %dh,0x40(%rsi,%rax,1)
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
  600ecf:	00 bb 00 00 00 00    	add    %bh,0x0(%rbx)
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
  600f2f:	00 88 04 40 00 00    	add    %cl,0x4004(%rax)
  600f35:	00 00                	add    %al,(%rax)
  600f37:	00 07                	add    %al,(%rdi)
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 70 04             	add    %dh,0x4(%rax)
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
  600f6f:	00 30                	add    %dh,(%rax)
  600f71:	04 40                	add    $0x40,%al
  600f73:	00 00                	add    %al,(%rax)
  600f75:	00 00                	add    %al,(%rax)
  600f77:	00 ff                	add    %bh,%bh
  600f79:	ff                   	(bad)  
  600f7a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f7d:	00 00                	add    %al,(%rax)
  600f7f:	00 02                	add    %al,(%rdx)
  600f81:	00 00                	add    %al,(%rax)
  600f83:	00 00                	add    %al,(%rax)
  600f85:	00 00                	add    %al,(%rax)
  600f87:	00 f0                	add    %dh,%al
  600f89:	ff                   	(bad)  
  600f8a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f8d:	00 00                	add    %al,(%rax)
  600f8f:	00 1c 04             	add    %bl,(%rsp,%rax,1)
  600f92:	40 00 00             	add    %al,(%rax)
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
  601018:	f6 04 40 00          	testb  $0x0,(%rax,%rax,2)
  60101c:	00 00                	add    %al,(%rax)
  60101e:	00 00                	add    %al,(%rax)
  601020:	06                   	(bad)  
  601021:	05 40 00 00 00       	add    $0x40,%eax
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
  21:	74 20                	je     43 <_init-0x400475>
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
  4d:	74 20                	je     6f <_init-0x400449>
  4f:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
  53:	31                   	.byte 0x31
  54:	2d                   	.byte 0x2d
  55:	31 29                	xor    %ebp,(%rcx)
	...
